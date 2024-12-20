//
//  DaysInYearTextView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import SwiftUI

struct DayOfWeekTextView: View {
    var DayOfWeekX: String
    
    var body: some View {
        if #available(iOS 16.0, watchOS 9.0, *) {
            Text(DayOfWeekX)
                .contentTransition(.numericText(countsDown: true))
                .animation(.default, value: DayOfWeekX)
                .font(.system(size: 42, weight: .medium, design: .monospaced))
                .foregroundColor(.green)
                .animation(.easeInOut(duration: 0.5), value: DayOfWeekX)
                
        } else {
            // Fallback on earlier versions
            Text(DayOfWeekX)
                .animation(.default, value: DayOfWeekX)
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: DayOfWeekX)
        }
    }
}

#Preview {
    DayOfWeekTextView(DayOfWeekX: "42")
}
