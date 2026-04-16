//
//  LinuxMain.swift
//  Zen Pi - Linux Terminal Interface
//
//  Provides a terminal-based interface for Zen Pi on Linux systems.
//  On macOS, this file is excluded via conditional compilation.
//

#if os(Linux)
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

// ANSI escape codes for terminal colors
struct ANSIColor {
    static let green = "\u{1B}[32m"
    static let blue = "\u{1B}[34m"
    static let bold = "\u{1B}[1m"
    static let reset = "\u{1B}[0m"
    static let clearScreen = "\u{1B}[2J\u{1B}[H"
    static let gray = "\u{1B}[90m"
    static let white = "\u{1B}[37m"
    static let cyan = "\u{1B}[36m"
}

/// Fetches the daily outlook entry from the server synchronously.
func fetchDailyOutlook(doy: Int) -> String {
    let semaphore = DispatchSemaphore(value: 0)
    var result = "Unable to fetch daily outlook."

    EntryService.shared.getEntryString(doy: doy) { entryString in
        if let entry = entryString {
            result = entry
        }
        semaphore.signal()
    }

    _ = semaphore.wait(timeout: .now() + 10)
    return result
}

/// Renders the terminal display with current time data.
func renderDisplay(secondsToday: String, secondsYear: String, dailyOutlook: String) {
    let dayOfYear = getDayOfYearX()
    let daysLeft = daysinyear()
    let weekNum = weekNumber()
    let dayOfWeek = dayNumber()

    print(ANSIColor.clearScreen, terminator: "")

    // Header
    print("\(ANSIColor.cyan)\(ANSIColor.bold)╔══════════════════════════════════════════════════╗\(ANSIColor.reset)")
    print("\(ANSIColor.cyan)\(ANSIColor.bold)║                    ZEN PI                        ║\(ANSIColor.reset)")
    print("\(ANSIColor.cyan)\(ANSIColor.bold)║            Time & Calendar Tracker               ║\(ANSIColor.reset)")
    print("\(ANSIColor.cyan)\(ANSIColor.bold)╚══════════════════════════════════════════════════╝\(ANSIColor.reset)")
    print()

    // Day info row
    let dayYearLabel = "Day Of Year"
    let daysRemLabel = "Days Remaining"
    print("  \(ANSIColor.white)\(dayYearLabel)\(ANSIColor.reset)                          \(ANSIColor.white)\(daysRemLabel)\(ANSIColor.reset)")
    print("  \(ANSIColor.bold)\(ANSIColor.green)\(padCenter(dayOfYear, width: 11))\(ANSIColor.reset)                          \(ANSIColor.bold)\(ANSIColor.green)\(padCenter(daysLeft, width: 14))\(ANSIColor.reset)")
    print()
    print("  \(ANSIColor.gray)──────────────────────────────────────────────\(ANSIColor.reset)")
    print()

    // Week info row
    let weekLabel = "Week Number"
    let dowLabel = "Day of Week"
    print("  \(ANSIColor.white)\(weekLabel)\(ANSIColor.reset)                          \(ANSIColor.white)\(dowLabel)\(ANSIColor.reset)")
    print("  \(ANSIColor.bold)\(ANSIColor.green)\(padCenter(weekNum, width: 11))\(ANSIColor.reset)                          \(ANSIColor.bold)\(ANSIColor.green)\(padCenter(dayOfWeek, width: 11))\(ANSIColor.reset)")
    print()
    print("  \(ANSIColor.gray)──────────────────────────────────────────────\(ANSIColor.reset)")
    print()

    // Seconds remaining
    print("  \(ANSIColor.green)Seconds Remaining This Year\(ANSIColor.reset)")
    print("  \(ANSIColor.bold)\(ANSIColor.green)\(secondsYear)\(ANSIColor.reset)")
    print()
    print("  \(ANSIColor.green)Seconds Remaining Today\(ANSIColor.reset)")
    print("  \(ANSIColor.bold)\(ANSIColor.green)\(secondsToday)\(ANSIColor.reset)")
    print()
    print("  \(ANSIColor.gray)──────────────────────────────────────────────\(ANSIColor.reset)")
    print()

    // Daily Outlook
    print("  \(ANSIColor.green)Daily Outlook\(ANSIColor.reset)")
    print("  \(ANSIColor.green)\(dailyOutlook)\(ANSIColor.reset)")
    print()

    // Footer
    print("  \(ANSIColor.gray)App Version: \(getAppVersion())  Build: \(getBuildNumber())\(ANSIColor.reset)")
    print("  \(ANSIColor.blue)https://www.zenpi.app\(ANSIColor.reset)")
    print()
    print("  \(ANSIColor.gray)Press Ctrl+C to exit\(ANSIColor.reset)")
}

/// Pad a string to center it within a given width.
func padCenter(_ str: String, width: Int) -> String {
    guard str.count < width else { return str }
    let padding = width - str.count
    let leftPad = padding / 2
    let rightPad = padding - leftPad
    return String(repeating: " ", count: leftPad) + str + String(repeating: " ", count: rightPad)
}

@main
struct ZenPiLinux {
    static func main() {
        // Refresh the daily outlook whenever the calendar day rolls over.
        var lastFetchedDOY = getDayOfYear()
        var dailyOutlook = fetchDailyOutlook(doy: lastFetchedDOY)

        // Set up signal handler for clean exit
        signal(SIGINT) { _ in
            print("\n\(ANSIColor.reset)Goodbye!")
            exit(0)
        }

        // Main loop: update display every second
        while true {
            let now = Date()
            let secondsToday = convertToSecondsLeftInTheDay(date: now)
            let secondsYear = setupNewYear(date: now)
            let currentDOY = getDayOfYear()

            if currentDOY != lastFetchedDOY {
                lastFetchedDOY = currentDOY
                dailyOutlook = fetchDailyOutlook(doy: currentDOY)
            }

            renderDisplay(
                secondsToday: secondsToday,
                secondsYear: secondsYear,
                dailyOutlook: dailyOutlook
            )

            // Sleep until the next whole second
            let delay = determineTimeIntervalUntilTheNextWholeSecond(from: Date())
            Thread.sleep(forTimeInterval: delay > 0 ? delay : 1.0)
        }
    }
}

#endif // os(Linux)
