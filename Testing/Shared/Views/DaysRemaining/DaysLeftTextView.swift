//
//  DaysInYearTextView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import SwiftUI

struct DaysLeftTextView: View {
    let DaysLeftOfYear: String
    
    var body: some View {
        if #available(iOS 16.0, watchOS 9.0, *) {
            Text(DaysLeftOfYear)
                .contentTransition(.numericText(countsDown: true))
                .animation(.default, value: DaysLeftOfYear)
                .font(.system(size: 42, weight: .medium, design: .monospaced))
                .foregroundColor(.green)
                .animation(.easeInOut(duration: 0.5), value: DaysLeftOfYear)
        } else {
            // Fallback on earlier versions
            Text(DaysLeftOfYear)
                .animation(.default, value: DaysLeftOfYear)
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: DaysLeftOfYear)
        }
    }
}

#Preview {
    DaysLeftTextView(DaysLeftOfYear: "42")
}
