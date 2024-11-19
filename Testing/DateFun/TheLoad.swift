//
//  TheLoad.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import SwiftUI
import Foundation
import Combine

func getDayOfYear() -> Int {
    
    let date = Date() // now
    let cal = Calendar.current
    let day1 = cal.ordinality(of: .day, in: .year, for: date)!

    return day1
    
}


func daysinyear() -> Int {
    
    var days2: Int
    let NoW = getDayOfYear()
    let currentDate = Date()
    let calendar = Calendar.current
    let currentYear = calendar.component(.year, from: currentDate)
    
    
    if currentYear % 4 == 0 {
        
        days2 = 366
        
    } else {
        
        days2 = 365
    }
    
    
    let daysRemaining = days2 - NoW
    
    return daysRemaining
    
    
    
}


func weekNumber() -> String {
    
    let calendar = Calendar.current
    let weekOfYear = calendar.component(.weekOfYear, from: Date(timeIntervalSinceNow: 0))
    
    let WeekOfYearX = String(weekOfYear)
    return WeekOfYearX
    
    
}

func dayNumber() -> String {
    
    let calendar = Calendar.current
    let dayOfWeek = calendar.component(.weekday, from: Date(timeIntervalSinceNow: 0))
    let DayOfWeekX = String(dayOfWeek)
    return DayOfWeekX
    
    
}

class mySetVarX {
    
    let currentTimePublisher = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default)
    let cancellable: AnyCancellable?
    
    init() {
        
        self.cancellable = currentTimePublisher.connect() as? AnyCancellable
        
    }
    
    
    deinit {
        self.cancellable?.cancel()
    }
    
    
}
  
