//
//  DaysInYearView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import SwiftUI

struct DaysInYearView: View {
    @StateObject var model: SuperModel
    
    var body: some View {
        DaysInYearTextView(DayOfYearSet: model.DayOfYear)
            .onAppear(perform: model.startNow)
            
    }
}

@available(iOS 17.0, *)
#Preview {
    let model = SuperModel()
    DaysInYearView(model: model)
}
