//
//  ContentView.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import SwiftUI




struct ContentView: View {
    var body: some View {
        
        @State var refreshView = false
        
        @Environment(\.openURL) var openLink
        
        
        
        @State var DOY = getDayOfYear()
        @State var DRNoW = daysinyear()
        @State var WN = weekNumber()
        @State var DN = dayNumber()
        
        
        
        
        
        
        VStack {
            
            Text("Zen Pi!")
                .font(.system(size: 42, weight: .medium, design: .serif))
            
            
                .padding()
            HStack(spacing: 100) {
                
                VStack() {
                    
                    Text("Day Of Year")
                    Text("\(DOY)")
                        .font(.system(size: 42, weight: .medium, design: .serif))
                        .foregroundColor(.green)
                        .onReceive(NotificationCenter.default
                                    .publisher(for: NSNotification.Name.NSCalendarDayChanged)) { (output) in
                                    // Update variables at midnight here
                                        DOY = getDayOfYear()
                                }
                }
                
                
                
                Spacer()
                VStack {
                    
                    
                    
                    Text("Days Remaining")
                    Text("\(DRNoW)")
                        .font(.system(size: 42, weight: .medium, design: .serif))
                        .foregroundColor(.green)
                        .onReceive(NotificationCenter.default
                                    .publisher(for: NSNotification.Name.NSCalendarDayChanged)) { (output) in
                                    // Update variables at midnight here
                                        DRNoW = daysinyear()
                                }
                       
                        
                }
                
            }
                Divider()
                
                HStack(spacing: 100) {
                    
                    VStack {
                        
                        
                        Text("Week Number")
                        Text("\(WN)")
                            .font(.system(size: 42, weight: .medium, design: .serif))
                            .foregroundColor(.green)
                            .onReceive(NotificationCenter.default
                                        .publisher(for: NSNotification.Name.NSCalendarDayChanged)) { (output) in
                                        // Update variables at midnight here
                                            WN = weekNumber()
                                    }
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("Day of Week")
                        
                        Text("\(DN)")
                            .font(.system(size: 42, weight: .medium, design: .serif))
                            .foregroundColor(.green)
                            .onReceive(NotificationCenter.default
                                        .publisher(for: NSNotification.Name.NSCalendarDayChanged)) { (output) in
                                        // Update variables at midnight here
                                            DN = dayNumber()
                                    }
                    }
                }
                
            
                
                
                VStack(spacing: 10) {
                    
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
                    
                    
                    
                    
                }
                
                
                .frame(minWidth: 600, minHeight: 300)
                .background(Color.black)
                
                Button {
                    openLink(URL(string: "https://links.xyzzy42.me/")!)
                } label: {
                    Text("XYZZY 42 Me")
                        .frame(width: 120, height: 60)
                        .background(.blue)
                        .foregroundStyle(.green)
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                        .clipShape(.rect)
                }
            
            
            Button("Refresh View") {
                refreshView.toggle()
            }
            .buttonStyle(.borderedProminent)
            
            
            }
        
            
            
            .padding()
        }
        
        
        
    }


#Preview {
    ContentView()
}



