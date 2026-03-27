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
final class SuperModelDO: ObservableObject {
    
    @Published private(set) var dailyX: String = "Loading. . ." /// Must have a default value
    ///
    private var bagSetX = Set<AnyCancellable>()
    
    
    func beginStartX() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateGroupxx(notification:)), name: .NSCalendarDayChanged, object: nil)
        
    }
    
    init() {
        Task {
            let result = await buildIt()
            DispatchQueue.main.async {
                self.dailyX = result ?? ""
            }
        }
    }
    
    
    /// NEW USING ASYNC
    func buildIt() async -> String? {
        await withCheckedContinuation { continuation in
            // Call the completion-based method
            EntryService.shared.getEntryString(doy: getDayOfYear()) { entryString in
                // Resume the continuation with the result
                continuation.resume(returning: entryString)
            }
        }
    }
    
    
    @objc func updateGroupxx(notification : NSNotification) {
        Task {
            let result = await buildIt()
            DispatchQueue.main.async {
                self.dailyX = result ?? ""
            }
        }
    }
    
}




@MainActor
final class SuperModel: ObservableObject {
   
    @Published private(set) var WeekNumber: String = weekNumber()
    @Published private(set) var DaysLeft: String = daysinyear()
    @Published private(set) var DayOfYear: String = getDayOfYearX()
    @Published private(set) var DayOfWeek: String = dayNumber()
   
    
    
    private var bagSet = Set<AnyCancellable>()
    
    func startNow() {
        
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateGroupx(notification:)), name: .NSCalendarDayChanged, object: nil)
           
        
     
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
