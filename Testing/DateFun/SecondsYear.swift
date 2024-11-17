//
//  SecondsYear.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import Foundation


import SwiftUI
import Combine

@MainActor
final class SecondsYearModel: ObservableObject {
   
    @Published private(set) var NewYearsDate: String = "31,536,000"
    
    private var bagX = Set<AnyCancellable>()
    
    func startX() {

        
     
        let now = Date()
        let delay = determineTimeIntervalUntilTheNextWholeSecond(from: now)
        
        
       
        
        
        
        
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            // Don't start publisher if self doesn't exist.
            guard let self else { return }
            // Create a Timer that fires every second and updates countDownText.
            Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .map(setupNewYear(date:))
                .sink { [weak self] timeString in
                    self?.NewYearsDate = timeString
                }
                .store(in: &self.bagX)
        }
    }
    
    func stopX() {
        bagX.removeAll(keepingCapacity: true)
    }
}





func setupNewYear(date: Date) -> String {
    
  
        let currentDate = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: currentDate)
        let yearX1 = currentYear + 1
        
        
        
        let year = yearX1
        let month = 1
        let day = 1
        let hour = 0
        let minute = 0
        let second = 0

        var components = DateComponents()

        components.year = year

        components.month = month

        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second

  

        let dateX = Calendar.current.date(from: components)! // Create Date object from components

        let NewYearDay =  dateX.timeIntervalSince(currentDate) // Returns the number of seconds between 'now' and 'pastDate'
    
    var NewYearDayInt = Int(NewYearDay)
    
    var fixoffset = NewYearDayInt + 1

    var NewYearXDay = String(fixoffset)

    
    return "\(NewYearXDay)"
    
    
}


func setupTimeD(date: Date) -> String {
    
  
        let currentDate = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: currentDate)
        let yearX1 = currentYear + 1
        
        
        
        let year = yearX1
        let month = 1
        let day = 1
        let hour = 0
        let minute = 0
        let second = 0

        var components = DateComponents()

        components.year = year

        components.month = month

        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second

  

        let dateX = Calendar.current.date(from: components)! // Create Date object from components

        let NewYearDay =  dateX.timeIntervalSince(currentDate) // Returns the number of seconds between 'now' and 'pastDate'
    
    var NewYearDayInt = Int(NewYearDay)

    var NewYearXDay = String(NewYearDayInt)

    
    return "\(dateX)"
    
    
}

    
   
    
    
