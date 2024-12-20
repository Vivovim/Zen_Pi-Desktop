//
//  SuperModel.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//

//
//  DaysInYear.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import Foundation
import SwiftUI
import Combine

@MainActor
final class SuperModel: ObservableObject {
   
    @Published private(set) var WeekNumber: String = weekNumber()
    @Published private(set) var DaysLeft: String = daysinyear()
    @Published private(set) var DayOfYear: String = getDayOfYearX()
    @Published private(set) var DayOfWeek: String = dayNumber()
    
    @Published private(set) var reloadX: Double = getreloaddataX()
    
    
  
    
    
    private var bagSet = Set<AnyCancellable>()
    
    func startNow() {
        
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateGroupx(notification:)), name: .NSCalendarDayChanged, object: nil)
           
        
       // var x86400 = Timer()
        
       // x86400 = Timer.scheduledTimer(
       //     timeInterval: 1,
       //     target: self,
       //     selector: #selector(updateGroupx),
       //     userInfo: nil,
       //     repeats: true
            
       // )
    }
        
    @objc func updateGroupx(notification : NSNotification ) {
        
        
        WeekNumber = weekNumber()
        DaysLeft = daysinyear()
        DayOfYear = getDayOfYearX()
        DayOfWeek = dayNumber()
        
    }
   
    
}




func weekNumber() -> String {
    
    let calendar = Calendar.current
    let weekOfYear = calendar.component(.weekOfYear, from: Date(timeIntervalSinceNow: 0))
    
    let WeekOfYearX = String(weekOfYear)
    return WeekOfYearX
    
    
}





func daysinyear() -> String {
    
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
    let DaysRemain = String(daysRemaining)
    return DaysRemain
    
    
    
}




func getDayOfYear() -> Int {
    
    let date = Date() // now
    let cal = Calendar.current
    let day1 = cal.ordinality(of: .day, in: .year, for: date)!
    
    
    

    return day1
    
}




func getDayOfYearX() -> String {
    
    let date = Date() // now
    let cal = Calendar.current
    let day1 = cal.ordinality(of: .day, in: .year, for: date)!
    
    let dayX = String(day1)
    

    return dayX
    
}




func dayNumber() -> String {
    
    let calendar = Calendar.current
    let dayOfWeek = calendar.component(.weekday, from: Date(timeIntervalSinceNow: 0))
    let DayOfWeekX = String(dayOfWeek)
    return DayOfWeekX
    
    
}




func getreloaddataX() -> Double {
    let NoW = Date()
    let calendar = Calendar.current
    let midnight = calendar.startOfDay(for: NoW)
    let secondsInDay: TimeInterval = 60 * 60 * 24
    let elapsed = NoW.timeIntervalSince(midnight)
    // Midnight is of value 0, but it resets to 84600 at 00:00.
    // If you want 23:59:59 to present that value zero remove the +1 in the next line of code.
    let secondsLeft = Int(secondsInDay - elapsed) + 1
    let xsecondsLeft = Double(secondsLeft)
    return xsecondsLeft
}
