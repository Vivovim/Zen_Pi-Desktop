//
//  ContentView.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

#if canImport(SwiftUI)
import SwiftUI
import Combine
#if canImport(AppKit)
import AppKit
#endif

struct Option: Hashable {
    let label: String
    var selected: Bool
    var showDetail: Bool
}


   

struct ContentView: View {
    @StateObject private var calendarModel = SuperModel()
    @StateObject private var countdownModel = SuperModelX()

   
    @State var options: [Option] = [
        Option(label: "Seconds Remaining", selected: true, showDetail: true),
        Option(label: "Daily Outlook", selected: false, showDetail: false)
    ]
    
    var body: some View {
        @Environment(\.openURL) var openLink
        
        
        Spacer()
            .frame(height: 20)
        
        VStack {
            HStack(spacing: 10) {
                VStack() {
                    
                    Text("Day Of Year")
                    DaysInYearView(model: calendarModel)
                }
                Spacer()
                    .frame(width: 250)
                
                VStack {
                    Text("Days Remaining")
                    DaysLeftView(model: calendarModel)
                    
                }
                
            }
            Divider()
                .frame(width: 400)
            
            HStack(spacing: 10) {
                VStack {
                    Text("Week Number")
                    WeekNumberView(model: calendarModel)
                }
                Spacer()
                    .frame(width: 250)
                VStack {
                    Text("Day of Week")
                    DayOfWeekView(model: calendarModel)
                }
            }
            
            
           
            OptionPicker(options: $options)
            
            
            
            if (options[0].showDetail == true) {
                
                VStack(spacing: 10) {
                    
                    Text("Seconds Remaining This Year")
                        .foregroundStyle(Color.green)
                        .fontWeight(.medium)
                        .font(.title3)
                    SecondsYearView(model: countdownModel)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Text("Seconds Remaining Today")
                        .foregroundStyle(Color.green)
                        .fontWeight(.medium)
                        .font(.title3)
                    CountDownView(model: countdownModel)
                    
                    
                    
                    
                }
                
                
                .frame(minWidth: 500, maxHeight: 325)
                .background(Color.black)
                .border(.gray, width: 2)
                
                
            } else {
                
                VStack(spacing: 20) {
                    Text("Daily Outlook")
                        .foregroundStyle(Color.green)
                        .fontWeight(.medium)
                        .font(.title3)
                    DailyOutLookView()
                }
                .padding()
                
                .frame(maxWidth: 400)
                .background(Color.black)
                .border(.gray, width: 2)
            }
            
            
        
            
           
            
            
            
            
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
        
        Spacer()
            .frame(height: 20)
        .padding()
        }
    }


struct OptionPicker: View {
    @Binding var options: [Option]
    
    
    var body: some View {
        HStack(spacing: 0) {
            
            ForEach(options.indices, id: \.self) { i in
                Text(options[i].label)
                
                    .padding(.horizontal, 4)
                    .padding(5)
                    .background(options[i].selected ? .blue : .gray)
                
                
                    .onTapGesture {
                        

                        options[i].selected.toggle()
                        options[0].showDetail.toggle()

                        
                        
                        if (options[i] == options[0]) {
                            options[0].selected = true
                            options[1].selected = false
                        } else {
                            options[1].selected = true
                            options[0].selected = false
                        }
                        

                        if (options[i] == options[0]) {
                            options[0].showDetail = true
                        } else {
                            options[1].showDetail = true
                            options[0].showDetail = false
                        }
                        
                      
                        
                    }
                
            }
        }
        .foregroundColor(.white)
        .cornerRadius(10)
        .frame(height: 32)
    }
}

#Preview {
    ContentView()
}

#endif // canImport(SwiftUI)
