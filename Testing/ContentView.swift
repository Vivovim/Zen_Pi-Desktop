//
//  ContentView.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import SwiftUI
import Combine
import AppKit



struct ContentView: View {
    var body: some View {
        @Environment(\.openURL) var openLink
        VStack {
            HStack(spacing: 10) {
                VStack() {
                    
                    Text("Day Of Year")
                    let DaysOfYearModel = SuperModel()
                    DaysInYearView(model: DaysOfYearModel)
                }
                Spacer()
                    .frame(width: 150)
                
                VStack {
                    Text("Days Remaining")
                    let DaysLeftModel = SuperModel()
                    DaysLeftView(model: DaysLeftModel)
                        
                }
                
            }
                Divider()
                .frame(width: 400)
            
                HStack(spacing: 10) {
                    VStack {
                        Text("Week Number")
                        let WeekNumberModel = SuperModel()
                        WeekNumberView(model: WeekNumberModel)
                    }
                    Spacer()
                        .frame(width: 150)
                    VStack {
                        Text("Day of Week")
                        let DayOfWeekModel = SuperModel()
                        DayOfWeekView(model: DayOfWeekModel)
                    }
                }
                
            
                
                
                VStack(spacing: 10) {
                    
                    Text("Seconds Remaining This Year")
                        .foregroundStyle(Color.green)
                        .fontWeight(.medium)
                        .font(.title3)
                    let SecondsYearModel = SuperModelX()
                    SecondsYearView(model: SecondsYearModel)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Text("Seconds Remaining Today")
                        .foregroundStyle(Color.green)
                        .fontWeight(.medium)
                        .font(.title3)
                    let countDownModel = SuperModelX()
                    CountDownView(model: countDownModel)
                    
                    
                    
                    
                }
                
                
                .frame(minWidth: 400, maxHeight: 250)
                .background(Color.black)
                .border(.gray, width: 2)
                
                Spacer()
                Button {
                    openLink(URL(string: "https://links.xyzzy42.me/")!)
                    
                    
                } label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                    Text("XYZZY 42 Me")
                        .tint(.blue)
                        
                }
                
                .controlSize(.regular)
                .foregroundColor(.white)
                .padding()
                .buttonStyle(.borderedProminent)
                .background(.blue)
                .cornerRadius(10)
            
           
            
            
            }
        
            
        .padding()
        }
        
        
        
    }


#Preview {
    ContentView()
}



