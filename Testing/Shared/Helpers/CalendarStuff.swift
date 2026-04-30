//
//  CalendarStuff.swift
//  86400
//
//  Created by Mark Cornelisse on 31/10/2024.
//

import Foundation

/// Formats an integer with locale-aware grouping separators (e.g., 86400 -> "86,400").
/// Uses a lightweight formatter to avoid allocating NumberFormatter instances every tick.
func formattedNumber(_ value: Int) -> String {
    let separator = Locale.current.groupingSeparator ?? ","
    let digits = String(abs(value))
    guard digits.count > 3 else {
        return value < 0 ? "-\(digits)" : digits
    }

    var groups: [String] = []
    groups.reserveCapacity((digits.count + 2) / 3)

    var endIndex = digits.endIndex
    while endIndex > digits.startIndex {
        let startIndex = digits.index(endIndex, offsetBy: -3, limitedBy: digits.startIndex) ?? digits.startIndex
        groups.append(String(digits[startIndex..<endIndex]))
        endIndex = startIndex
    }

    let formatted = groups.reversed().joined(separator: separator)
    return value < 0 ? "-\(formatted)" : formatted
}

/// Converts a value of Date to the amount of seconds left in a day
/// - Parameter date: A date value of which the amount of seconds left in it's day will be calculated
/// - Returns: A string that represents the amount of seconds left in the day.
func convertToSecondsLeftInTheDay(date: Date) -> String {
    let calendar = Calendar.current
    let midnight = calendar.startOfDay(for: date)
    let secondsInDay: TimeInterval = 60 * 60 * 24
    let elapsed = date.timeIntervalSince(midnight)
    // Midnight is of value 0, but it resets to 84600 at 00:00.
    // If you want 23:59:59 to present that value zero remove the +1 in the next line of code.
    let secondsLeft = Int(secondsInDay - elapsed) + 1
    let formattedsecondsLeft = formattedNumber(secondsLeft)
    return "\(formattedsecondsLeft)"
}

func determineTimeIntervalUntilTheNextWholeSecond(from date: Date) -> TimeInterval {
    // Determine time until the next whole second.
    let nextWholeSecond = date.timeIntervalSinceReferenceDate.rounded(.up)
    let delay = max(0, nextWholeSecond - date.timeIntervalSinceReferenceDate)
    return delay
}

func determineDateOfLastWholeSecond(from date: Date) -> Date {
    let nextWholeSecond = date.timeIntervalSinceReferenceDate.rounded(.down)
    let delay = max(0, nextWholeSecond - date.timeIntervalSinceReferenceDate)
    return Date(timeIntervalSinceReferenceDate: nextWholeSecond + delay)
}

func determineDateOfNextWholeSecond(from date: Date) -> Date {
    let nextWholeSecond = date.timeIntervalSinceReferenceDate.rounded(.up)
    let delay = max(0, nextWholeSecond - date.timeIntervalSinceReferenceDate)
    return Date(timeIntervalSinceReferenceDate: nextWholeSecond + delay)
}
