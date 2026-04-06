//
//  DailyOutlookView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 12/20/24.
//

//
//  DailyOutlookView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 12/20/24.
//

//
//  DaysInYearView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


#if canImport(SwiftUI)
import SwiftUI

struct DailyOutLookView: View {
    @StateObject var model: SuperModelDO
    
    var body: some View {
        DailyOutlookTextView(DailyOutLook: model.dailyX)
            .onAppear(perform: model.beginStartX)
            
    }
}

@available(iOS 17.0, *)
#Preview {
    let modelXD = SuperModelDO()
    DailyOutLookView(model: modelXD)
}

#endif // canImport(SwiftUI)
