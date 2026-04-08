//
//  DailyOutlookTextView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 12/20/24.
//

//
//  DailyOutlookTextView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 12/20/24.
//



//
//  DaysInYearTextView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/20/24.
//


#if canImport(SwiftUI)
import SwiftUI

struct DailyOutlookTextView: View {
    let DailyOutLook: String
    
    var body: some View {
        if #available(iOS 16.0, watchOS 9.0, *) {
            Text(DailyOutLook)
                .contentTransition(.numericText(countsDown: true))
                .animation(.default, value: DailyOutLook)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.green)
                .animation(.easeInOut(duration: 0.5), value: DailyOutLook)
                .lineSpacing(20)
                .frame(maxWidth: 600)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
        } else {
            // Fallback on earlier versions
            Text(DailyOutLook)
                .animation(.default, value: DailyOutLook)
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                .animation(.easeInOut(duration: 0.5), value: DailyOutLook)
                .frame(maxWidth: 600)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

#Preview {
    DailyOutlookTextView(DailyOutLook: "42")
}





#endif // canImport(SwiftUI)
