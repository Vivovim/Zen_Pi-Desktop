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
    
    
    
    
    
    
    private var bagSet = Set<AnyCancellable>()
    
    func startNow() {
        
        
        var x86400 = Timer()
        
        x86400 = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateGroupx),
            userInfo: nil,
            repeats: true
        )
    }
        
    
    @objc func updateGroupx( _ sender: Timer) {
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
