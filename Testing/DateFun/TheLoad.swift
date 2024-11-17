//
//  TheLoad.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import SwiftUI
import Foundation


func getDayOfYear() -> Int {
    
    let date = Date() // now
    let cal = Calendar.current
    let day1 = cal.ordinality(of: .day, in: .year, for: date)!

    return day1
    
}


func daysinyear() -> Int {
    
    var days2: Int
    
    
    let NoW = getDayOfYear()
    
    if NoW % 4 != 0 {
        
        days2 = 366
        
    } else {
        
        days2 = 365
    }
    
    
    let daysRemaining = days2 - NoW
    
    return daysRemaining
    
    
    
}


func weekNumber() -> Int {
    
    let calendar = Calendar.current
    let weekOfYear = calendar.component(.weekOfYear, from: Date(timeIntervalSinceNow: 0))
    return weekOfYear
    
    
}

func dayNumber() -> Int {
    
    let calendar = Calendar.current
    let dayOfWeek = calendar.component(.weekday, from: Date(timeIntervalSinceNow: 0))
    return dayOfWeek
    
    
}

