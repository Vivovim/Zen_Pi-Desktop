//
//  CountDownTextView.swift
//  86400
//
//  Created by Mark Cornelisse on 31/10/2024.
//

import SwiftUI

struct SecondsYearTextView: View {
    let secondsNYD: String
    
    var body: some View {
        if #available(iOS 16.0, watchOS 9.0, *) {
            Text(secondsNYD)
                .contentTransition(.numericText(countsDown: true))
                .animation(.default, value: secondsNYD)
                .font(.system(size: 26, weight: .medium, design: .monospaced))
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: secondsNYD)
        } else {
            // Fallback on earlier versions
            Text(secondsNYD)
                .animation(.default, value: secondsNYD)
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: secondsNYD)
        }
    }
}

#Preview {
    SecondsYearTextView(secondsNYD: "31,536,000")
}
