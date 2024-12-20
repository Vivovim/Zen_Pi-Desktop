//
//  DaysInYearTextView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import SwiftUI

struct WeekNumberTextView: View {
    let WeekNumberX: String
    
    var body: some View {
        if #available(iOS 16.0, watchOS 9.0, *) {
            Text(WeekNumberX)
                .contentTransition(.numericText(countsDown: true))
                .animation(.default, value: WeekNumberX)
                .font(.system(size: 42, weight: .medium, design: .monospaced))
                .foregroundColor(.green)
                .animation(.easeInOut(duration: 0.5), value: WeekNumberX)
        } else {
            // Fallback on earlier versions
            Text(WeekNumberX)
                .animation(.default, value: WeekNumberX)
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: WeekNumberX)
        }
    }
}

#Preview {
    WeekNumberTextView(WeekNumberX: "42")
}
