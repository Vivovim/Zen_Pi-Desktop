//
//  ContentView.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import SwiftUI




struct ContentView: View {
    var body: some View {
        
        @Environment(\.openURL) var openLink
        
       

            let DOY = getDayOfYear()
            let DRNoW = daysinyear()
            let WN = weekNumber()
            let DN = dayNumber()
       
            
            
            
            VStack {
                
                Text("Zen Pi!")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                
                
                    .padding()
                HStack(spacing: 100) {
                    
                    VStack() {
                        
                        Text("Day Of Year")
                        Text("\(DOY)")
                            .font(.system(size: 42, weight: .medium, design: .serif))
                            .foregroundColor(.green)
                    }
                    Spacer()
                    VStack {
                        
                        
                        
                        Text("Days Remaining")
                        Text("\(DRNoW)")
                            .font(.system(size: 42, weight: .medium, design: .serif))
                            .foregroundColor(.green)
                    }
                }
                Divider()
                
                HStack(spacing: 100) {
                    
                    VStack {
                        
                        
                        Text("Week Number")
                        Text("\(WN)")
                            .font(.system(size: 42, weight: .medium, design: .serif))
                            .foregroundColor(.green)
                    }
                    Spacer()
                    
                    VStack {
                        
                        Text("Day of Week")
                        
                        Text("\(DN)")
                            .font(.system(size: 42, weight: .medium, design: .serif))
                            .foregroundColor(.green)
                    }
                }
                
               
                
                
                VStack {
                        
                        Text("Seconds Remaining This Year")
                            .foregroundStyle(Color.green)
                            .font(.caption)
                        let SecondsYearModel = SecondsYearModel()
                        SecondsYearView(model: SecondsYearModel)
                   
                    
                    
                    
                    Text("Seconds Remaining Today")
                        .foregroundStyle(Color.green)
                        .font(.caption)
                    let countDownModel = CountDownModel()
                    CountDownView(model: countDownModel)
                    
                    
                    
                    Button {
                        openLink(URL(string: "https://xyzzy42.me/links")!)
                    } label: {
                        Text("XYZZY 42 Me")
                            .frame(width: 120, height: 60)
                            .background(.blue)
                            .foregroundStyle(.green)
                            .fontWeight(.heavy)
                            .fontDesign(.rounded)
                            .clipShape(.rect)
                    }
                }
                
                
                .frame(minWidth: 600, minHeight: 400)
                .background(Color.black)
                
                
            }
            .padding()
        }
    }

#Preview {
    ContentView()
}



