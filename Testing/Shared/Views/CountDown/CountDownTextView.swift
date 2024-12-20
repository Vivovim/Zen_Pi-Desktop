//
//  CountDownTextView.swift
//  86400
//
//  Created by Mark Cornelisse on 31/10/2024.
//

import SwiftUI

struct CountDownTextView: View {
    let secondsLeft: String
    
    var body: some View {
        if #available(iOS 16.0, watchOS 9.0, *) {
            Text(secondsLeft)
                .contentTransition(.numericText(countsDown: true))
                .animation(.default, value: secondsLeft)
                .font(.system(size: 26, weight: .medium, design: .monospaced))
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: secondsLeft)
        } else {
            // Fallback on earlier versions
            Text(secondsLeft)
                .animation(.default, value: secondsLeft)
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: secondsLeft)
        }
    }
}

#Preview {
    CountDownTextView(secondsLeft: "86400")
}
