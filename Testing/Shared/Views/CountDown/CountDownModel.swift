//
//  CountDownModel.swift
//  86400
//
//  Created by Mark Cornelisse on 30/10/2024.
//

import SwiftUI
import Combine

@MainActor
final class CountDownModel: ObservableObject {
    @Published private(set) var countDownText: String = "86400"
    
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
}
