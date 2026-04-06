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
                    let DaysOfYearModel = SuperModel()
                    DaysInYearView(model: DaysOfYearModel)
                }
                Spacer()
                    .frame(width: 250)
                
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
                    .frame(width: 250)
                VStack {
                    Text("Day of Week")
                    let DayOfWeekModel = SuperModel()
                    DayOfWeekView(model: DayOfWeekModel)
                }
            }
            
            
           
            OptionPicker(options: $options)
            
            
            
            if (options[0].showDetail == true) {
                
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
                
                
                .frame(minWidth: 500, maxHeight: 325)
                .background(Color.black)
                .border(.gray, width: 2)
                
                
            } else {
                
                VStack(spacing: 20) {
                    Text("Daily Outlook")
                        .foregroundStyle(Color.green)
                        .fontWeight(.medium)
                        .font(.title3)
                    let dailyoutlookModel = SuperModelDO()
                    DailyOutLookView(model: dailyoutlookModel)
                }
                .padding()
                
                .frame(minWidth: 500, maxHeight: 325)
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

