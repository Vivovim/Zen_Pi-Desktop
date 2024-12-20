//
//  CountDownView.swift
//  86400
//
//  Created by Mark Cornelisse on 30/10/2024.
//

import SwiftUI

struct CountDownView: View {
    @StateObject var model: SuperModelX
    
    var body: some View {
        CountDownTextView(secondsLeft: model.countDownText)
            .onAppear(perform: model.start)
            .onDisappear(perform: model.stop)
    }
}

@available(iOS 17.0, *)
#Preview {
    let model = SuperModelX()
    CountDownView(model: model)
}
