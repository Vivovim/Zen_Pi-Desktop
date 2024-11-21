//
//  DaysInYearView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


import SwiftUI

struct DaysLeftView: View {
    @StateObject var model: SuperModel
    
    var body: some View {
        DaysLeftTextView(DaysLeftOfYear: model.DaysLeft)
            .onAppear(perform: model.startNow)
            
    }
}

@available(iOS 17.0, *)
#Preview {
    let modelX = SuperModel()
    DaysLeftView(model: modelX)
}
