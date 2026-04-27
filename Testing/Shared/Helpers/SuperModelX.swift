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
    @Published private(set) var countDownText: String = "86,400"
    @Published private(set) var NewYearsDate: String = "31,536,000"
    
    private var bag = Set<AnyCancellable>()
    
    func start() {
        startTimer(
            transform: convertToSecondsLeftInTheDay(date:),
            updatePublished: { self.countDownText = $0 }
        )
    }
    
    func startX() {
        startTimer(
            transform: setupNewYear(date:),
            updatePublished: { self.NewYearsDate = $0 }
        )
    }
    
    func stop() {
        bag.removeAll(keepingCapacity: true)
    }
    
    func stopX() {
        bag.removeAll(keepingCapacity: true)
    }
    
    // MARK: - Private Helper
    
    private func startTimer(
        transform: @escaping (Date) -> String,
        updatePublished: @escaping (String) -> Void
    ) {
        let now = Date()
        let delay = determineTimeIntervalUntilTheNextWholeSecond(from: now)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .map(transform)
                .sink { [weak self] timeString in
                    updatePublished(timeString)
                }
                .store(in: &self.bag)
        }
    }
}

// end here

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



   
    
    

