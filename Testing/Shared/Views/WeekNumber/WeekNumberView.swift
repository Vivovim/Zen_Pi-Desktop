//
//  DaysInYearView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import SwiftUI

struct WeekNumberView: View {
    @StateObject var model: SuperModel
    
    var body: some View {
        WeekNumberTextView(WeekNumberX: model.WeekNumber)
            .onAppear(perform: model.startNow)
            
    }
}

@available(iOS 17.0, *)
#Preview {
    let modelXX = SuperModel()
    WeekNumberView(model: modelXX)
}
