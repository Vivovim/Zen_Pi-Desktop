//
//  AppDelegate.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 11/17/24.
//

#if os(macOS)
import SwiftUI
import Foundation
import AppKit
import Combine

import Cocoa


class AppDelegate: NSObject, NSApplicationDelegate {
    
    var mainWnd: NSWindow?
    private var mainWndController: NSWindowController?
    
   
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        openMainWindow()
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
  
    

    private  var aboutBoxWindowController: NSWindowController?

        func showAboutPanel() {
            if aboutBoxWindowController == nil {
               // let styleMask: NSWindow.StyleMask = [.closable, .miniaturizable,/* .resizable,*/ .titled]
                var window = NSWindow()
                
                
                let windowWidth: CGFloat = 350
                let windowHeight: CGFloat = 600
                
                // Get the screen size (optional, for centering the window)
                let screenRect = NSScreen.main?.frame ?? NSRect.zero
                let windowRect = NSRect(
                    x: (screenRect.width - windowWidth) / 2,
                    y: (screenRect.height - windowHeight) / 2,
                    width: windowWidth,
                    height: windowHeight
                )
                
                window = NSWindow(
                           contentRect: windowRect,
                           styleMask: [.titled, .closable, .resizable],
                           backing: .buffered,
                           defer: false
                       )
                
                let contentView = NSView(frame: NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight))
                       contentView.wantsLayer = true // Enable layer-backed view
                       contentView.layer?.backgroundColor = NSColor.systemTeal.cgColor // Set a background color

                
                window.title = "About Zen Pi"
                window.contentView = NSHostingView(rootView: AboutView())
                aboutBoxWindowController = NSWindowController(window: window)
                
                
                   
                
                
                
                
            }
            
            
            
               

            aboutBoxWindowController?.showWindow(aboutBoxWindowController?.window)
        }
    
    
    func openMainWindow(show: Bool = true) {
        if mainWndController == nil {
            let wnd = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 550, height: 710),
                               styleMask: [.closable, .titled],
                               backing: .buffered,
                               defer: true)
            
            
            wnd.title = "Zen Pi"
            wnd.contentView = NSHostingView(rootView: ContentView())
            self.mainWnd = wnd
            self.mainWndController = NSWindowController(window: wnd)
        }
    }
    
}

#endif // os(macOS)


