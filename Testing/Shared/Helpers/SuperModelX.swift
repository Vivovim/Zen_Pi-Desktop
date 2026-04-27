//
//  SuperModelX.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//

#if os(Linux)
import Foundation
import Glibc
#else
import SwiftUI
import Combine
#endif

#if os(Linux)
final class SuperModelX {
    private var countDownText: String = "86,400"
    private var NewYearsDate: String = "31,536,000"
    
    private var timerTask: DispatchSourceTimer?
    
    func start() {
        startCombinedTimer()
    }
    
    func startX() {
        startCombinedTimer()
    }
    
    func stop() {
        timerTask?.cancel()
        timerTask = nil
    }
    
    func stopX() {
        stop()
    }
    
    func getCountDownText() -> String {
        return countDownText
    }
    
    func getNewYearsDate() -> String {
        return NewYearsDate
    }
    
    // MARK: - Private Helper
    
    private func startCombinedTimer() {
        // If timer is already running, don't start another
        guard timerTask == nil else { return }
        
        let queue = DispatchQueue.global(qos: .userInitiated)
        let timer = DispatchSource.makeTimerSource(queue: queue)
        
        let now = Date()
        let delay = determineTimeIntervalUntilTheNextWholeSecond(from: now)
        
        timer.schedule(deadline: .now() + delay, repeating: 1.0)
        timer.setEventHandler { [weak self] in
            guard let self else { return }
            // Update both values from a single timer tick
            self.countDownText = convertToSecondsLeftInTheDay(date: Date())
            self.NewYearsDate = setupNewYear(date: Date())
        }
        
        timer.resume()
        timerTask = timer
    }
}
#else
@MainActor
final class SuperModelX: ObservableObject {
    @Published private(set) var countDownText: String = "86,400"
    @Published private(set) var NewYearsDate: String = "31,536,000"
    
    private var bag = Set<AnyCancellable>()
    private var timerCancellable: AnyCancellable?
    
    func start() {
        startCombinedTimer()
    }
    
    func startX() {
        startCombinedTimer()
    }
    
    func stop() {
        timerCancellable?.cancel()
        timerCancellable = nil
        bag.removeAll(keepingCapacity: true)
    }
    
    func stopX() {
        stop()
    }
    
    // MARK: - Private Helper
    
    private func startCombinedTimer() {
        // If timer is already running, don't start another
        guard timerCancellable == nil else { return }
        
        let now = Date()
        let delay = determineTimeIntervalUntilTheNextWholeSecond(from: now)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            
            self.timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    guard let self else { return }
                    // Update both values from a single timer tick
                    self.countDownText = convertToSecondsLeftInTheDay(date: Date())
                    self.NewYearsDate = setupNewYear(date: Date())
                }
        }
    }
}
#endif

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

    let dateX = Calendar.current.date(from: components)!
    let NewYearDay = dateX.timeIntervalSince(currentDate)
    let NewYearDayInt = Int(NewYearDay)
    let fixoffset = NewYearDayInt + 1

	 let FormattedNewYearsDay = formattedNumber(fixoffset)
    
    
    let NewYearXDay = String(FormattedNewYearsDay)

    
    return "\(NewYearXDay)"
}
