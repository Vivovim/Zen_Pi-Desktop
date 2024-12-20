//
//  TestingApp.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import SwiftUI
import Combine

@main

struct Zen_Pi: App {
    
   
    
  
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some Scene {
    
        
        WindowGroup {
            ContentView()
                
                .frame(minWidth: 500, maxWidth: 750, minHeight: 550, maxHeight: 800)
               
        }
    }
}
