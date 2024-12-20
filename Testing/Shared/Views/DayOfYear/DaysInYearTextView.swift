//
//  DaysInYearTextView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import SwiftUI

struct DaysInYearTextView: View {
    let DayOfYearSet: String
    
    var body: some View {
        if #available(iOS 16.0, watchOS 9.0, *) {
            Text(DayOfYearSet)
                .contentTransition(.numericText(countsDown: true))
                .animation(.default, value: DayOfYearSet)
                .font(.system(size: 42, weight: .medium, design: .monospaced))
                .foregroundColor(.green)
                .animation(.easeInOut(duration: 0.5), value: DayOfYearSet)
                
        } else {
            // Fallback on earlier versions
            Text(DayOfYearSet)
                .animation(.default, value: DayOfYearSet)
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: DayOfYearSet)
        }
    }
}

#Preview {
    DaysInYearTextView(DayOfYearSet: "42")
}
