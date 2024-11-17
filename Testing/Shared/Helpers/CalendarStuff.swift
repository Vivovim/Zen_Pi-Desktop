//
//  CalendarStuff.swift
//  86400
//
//  Created by Mark Cornelisse on 31/10/2024.
//

import SwiftUI

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
    let formattedsecondsLeft = secondsLeft.formatted()
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
