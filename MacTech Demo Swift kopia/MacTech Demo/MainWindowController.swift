//
//  MainWindowController.swift
//  MacTech Demo
//
//  Created by MacTech on 2016-11-16.
//  Copyright © 2016 MacTech. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    @IBOutlet weak var spokenTextField: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func pressedReturn(_ sender: Any) {
        speakButtonClicked(sender)
    }
    
    @IBAction func speakButtonClicked(_ sender: Any) {
        print("Speak button clicked")
        print("\(spokenTextField.stringValue)")
        if let scriptPath = Bundle.main.path(forResource: "Script", ofType: "sh") {
            
            let scriptProcess = Process()
            scriptProcess.launchPath = scriptPath
            scriptProcess.arguments = [spokenTextField.stringValue]
            
            let stdoutPipe = Pipe()
            scriptProcess.standardOutput = stdoutPipe
            
            scriptProcess.launch()
            scriptProcess.waitUntilExit()
            
            print("Script exited with status \(scriptProcess.terminationStatus)")
            
            let stdoutData = stdoutPipe.fileHandleForReading.readDataToEndOfFile()
            let stdout = NSString(data: stdoutData, encoding: String.Encoding.utf8.rawValue)
            print("Received stdout: \(stdout)")
            
        } else {
            print("Couldn't find Script.sh")
        }
    }
}
