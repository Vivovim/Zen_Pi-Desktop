//
//  TestingApp.swift
//  Testing
//
//  Created by Christopher Huffaker on 11/16/24.
//

import SwiftUI
import Combine


struct HelpMenu: View {
  var body: some View {
    Group {
      Link("Visit Our Site", destination: URL(
        string: "https://www.zenpi.app/Support.php")!)
      // Place other Help menu items here.
    }
    }
    
    
}





@main

struct Zen_Pi: App {
    
    @Environment(\.openURL) var openHelpLink
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
   
    
   
    
    
    var body: some Scene {
        
        
        Window("Zen Pi", id: "mainwindow") {
            ContentView()
            
              
                .frame(width: 550, height: 710)
        }
       
        
        .windowResizability(.contentSize)
      
        
        .commands {
            CommandGroup(replacing: .help) {
                HelpMenu()
            }
        }
        
        
        
        .commands {
            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                Button(action: {
                    appDelegate.showAboutPanel()
                }) {
                    Text("About Zen Pi")
                }
            }
            
        }
        
       
        
        
        
    }
    
   
    
    
    
    
    
    
}

    
