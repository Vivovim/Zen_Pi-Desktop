//
//  DaysInYearView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import SwiftUI

struct DayOfWeekView: View {
    @StateObject var model: SuperModel
    
    var body: some View {
        DayOfWeekTextView(DayOfWeekX: model.DayOfWeek)
            .onAppear(perform: model.startNow)
            
    }
}

@available(iOS 17.0, *)
#Preview {
    let modelXX = SuperModel()
    DayOfWeekView(model: modelXX)
}
