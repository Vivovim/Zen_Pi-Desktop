//
//  CountDownView.swift
//  86400
//
//  Created by Mark Cornelisse on 30/10/2024.
//

import SwiftUI

struct SecondsYearView: View {
    @StateObject var model: SuperModelX
    
    var body: some View {
        SecondsYearTextView(secondsNYD: model.NewYearsDate)
            .onAppear(perform: model.startX)
            .onDisappear(perform: model.stopX)
    }
}

@available(iOS 17.0, *)
#Preview {
    let model = SuperModelX()
    SecondsYearView(model: model)
    
}
