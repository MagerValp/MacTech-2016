//
//  AppDelegate.swift
//  MacTech Demo
//
//  Created by MacTech on 2016-11-16.
//  Copyright © 2016 MacTech. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowController: MainWindowController?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.mainWindowController = MainWindowController(windowNibName: "MainWindowController")
        self.mainWindowController?.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

