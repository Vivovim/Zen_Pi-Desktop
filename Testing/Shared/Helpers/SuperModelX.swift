//
//  SuperModelX.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//

import SwiftUI
import Combine

@MainActor
final class SuperModelX: ObservableObject {
    @Published private(set) var countDownText: String = "86400"
    @Published private(set) var NewYearsDate: String = "31,536,000"
    
    
    
    private var bag = Set<AnyCancellable>()
    
    func start() {
        // Determine time until the next whole second.
        let now = Date()
        let delay = determineTimeIntervalUntilTheNextWholeSecond(from: now)
        // Launch Timer after delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            // Don't start publisher if self doesn't exist.
            guard let self else { return }
            // Create a Timer that fires every second and updates countDownText.
            Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .map(convertToSecondsLeftInTheDay(date:))
                .sink { [weak self] timeString in
                    self?.countDownText = timeString
                }
                .store(in: &self.bag)
        }
    }
    
    func stop() {
        bag.removeAll(keepingCapacity: true)
    }




    
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
                .store(in: &self.bag)
        }
    }
    
    func stopX() {
        bag.removeAll(keepingCapacity: true)
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

  

    let dateX = Calendar.current.date(from: components)!; // Create Date object from components

    let NewYearDay =  dateX.timeIntervalSince(currentDate)// Returns the number of seconds between 'now' and 'pastDate'
    
    let NewYearDayInt = Int(NewYearDay)
    
    let fixoffset = NewYearDayInt + 1


    let FormattedNewYearsDay = fixoffset.formatted()
    
    
    let NewYearXDay = String(FormattedNewYearsDay)

    
    
    
    
    
    
    
    
    
    return "\(NewYearXDay)"
    
    
    
    
    
    
}



   
    
    

