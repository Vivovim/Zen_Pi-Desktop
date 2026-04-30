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

    init() {
        refreshValues(for: Date())
    }
    
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

    deinit {
        stop()
    }
    
    func getCountDownText() -> String {
        return countDownText
    }
    
    func getNewYearsDate() -> String {
        return NewYearsDate
    }
    
    // MARK: - Private Helper

    private func refreshValues(for date: Date) {
        countDownText = convertToSecondsLeftInTheDay(date: date)
        NewYearsDate = setupNewYear(date: date)
    }
    
    private func startCombinedTimer() {
        // If timer is already running, don't start another
        guard timerTask == nil else { return }
        
        let queue = DispatchQueue.global(qos: .userInitiated)
        let timer = DispatchSource.makeTimerSource(queue: queue)
        
        let now = Date()
        refreshValues(for: now)
        let delay = determineTimeIntervalUntilTheNextWholeSecond(from: now)
        
        timer.schedule(deadline: .now() + delay, repeating: 1.0)
        timer.setEventHandler { [weak self] in
            guard let self else { return }
            let tickDate = Date()
            self.refreshValues(for: tickDate)
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
    
    private var timerCancellable: AnyCancellable?

    init() {
        refreshValues(for: Date())
    }
    
    func start() {
        startCombinedTimer()
    }
    
    func startX() {
        startCombinedTimer()
    }
    
    func stop() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }
    
    func stopX() {
        stop()
    }

    // MARK: - Private Helper

    private func refreshValues(for date: Date) {
        countDownText = convertToSecondsLeftInTheDay(date: date)
        NewYearsDate = setupNewYear(date: date)
    }
    
    private func startCombinedTimer() {
        // If timer is already running, don't start another
        guard timerCancellable == nil else { return }
        
        let now = Date()
        refreshValues(for: now)
        let delay = determineTimeIntervalUntilTheNextWholeSecond(from: now)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            
            self.timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    guard let self else { return }
                    let tickDate = Date()
                    self.refreshValues(for: tickDate)
                }
        }
    }
}
#endif

// end here

func setupNewYear(date: Date) -> String {
    let calendar = Calendar.current
    let currentYear = calendar.component(.year, from: date)

    var components = DateComponents()
    components.year = currentYear + 1
    components.month = 1
    components.day = 1
    components.hour = 0
    components.minute = 0
    components.second = 0

    guard let nextNewYear = calendar.date(from: components) else {
        return "0"
    }

    let secondsUntilNewYear = max(0, Int(nextNewYear.timeIntervalSince(date).rounded(.down)) + 1)
    return formattedNumber(secondsUntilNewYear)
}
