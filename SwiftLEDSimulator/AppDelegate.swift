//
//  AppDelegate.swift
//  SwiftLEDSimulator
//
//  Created by Kevin Brewster on 11/25/19.
//  Copyright © 2019 Kevin Brewster. All rights reserved.
//

import Cocoa
import SwiftUI
import SwiftLED

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let ledStrip = LEDStrip(numberOfLeds: 45)
        let ledStripView = LEDStripView(ledStrip: ledStrip)
        
        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: ledStripView)
        window.makeKeyAndOrderFront(nil)
        
        // Begin the examples
        ledStrip.runExampleRoutine()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
