//
//  AboutView.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 1/13/25.
//


import SwiftUI
import Combine
import AppKit





struct AboutView: View {
    
   
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Spacer()
                Image("ZenPi")
                Spacer()
                HStack {
                    Text("App Version: \(getAppVersion())")
                    Text("Build Number: \(getBuildNumber())")
                }
                
                Spacer()
                
                Text("By Christopher Huffaker")
                    .font(.title)
                Text("Copyright &copy; 2025 Christopher Huffaker")
                    .font(.caption)
                Spacer()
                
                Text("Special Thanks To:")
                    .font(.title)
                Text("My Mortal Family")
                Text("The Human Race")
            }
            Spacer()
                .frame(width: 50, height: 100)
        }
        .frame(minWidth: 350, minHeight: 600)
        
        
        
    }
    
       
       
    
}








#Preview {
    AboutView()
        
}
