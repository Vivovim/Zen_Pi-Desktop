//
//  ContentView.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import SwiftUI
import Combine
import AppKit


class veryimportant: ObservableObject {
    @Published var DOY = getDayOfYear()
    @Published var DRNoW = daysinyear()
    @Published var WN = weekNumber()
    @Published var DN = dayNumber()
    
}

struct ContentView: View {
    var body: some View {
        
    
        
        @Environment(\.openURL) var openLink
        
        @ObservedObject var viewModel = veryimportant()
       
        
    
        
           
           
        
        
        
        VStack {
            
            Text("Zen Pi!")
                .font(.system(size: 42, weight: .medium, design: .serif))
            
            
                .padding()
            HStack(spacing: 100) {
                
                VStack() {
                    
                    Text("Day Of Year")
                    let DaysOfYearModel = SuperModel()
                    DaysInYearView(model: DaysOfYearModel)
                }
                
                
                
                Spacer()
                VStack {
                    
                    
                    
                    Text("Days Remaining")
                    let DaysLeftModel = SuperModel()
                    DaysLeftView(model: DaysLeftModel)
                        
                }
                
            }
                Divider()
                
                HStack(spacing: 100) {
                    
                    VStack {
                        
                        
                        Text("Week Number")
                        let WeekNumberModel = SuperModel()
                        WeekNumberView(model: WeekNumberModel)
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("Day of Week")
                        
                        let DayOfWeekModel = SuperModel()
                        DayOfWeekView(model: DayOfWeekModel)
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
            
            
           
            
            
            }
        
            
            
            .padding()
        }
        
        
        
    }


#Preview {
    ContentView()
}



