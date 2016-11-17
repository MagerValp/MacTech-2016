Build your first Mac app with Xcode
===================================

Here are the slides (with speaker notes) and the demo app I built during my MacTech 2016 presentation, Build your first Mac app with Xcode. I built the app in Swift during the talk, but I've also added Objective-C and Python versions in this repo.


Things I Didn't Have Time To Cover
----------------------------------


### Capturing stdout and exit status

To capture the output from your shell script, create an `NSPipe`, assign that to the `NSTask`'s `standardInput`, and then read it using the pipe's `fileHandleForReading`. Exit status is available in `terminationStatus`.

```swift
let scriptProcess = Process()
scriptProcess.launchPath = scriptPath
scriptProcess.arguments = [spokenTextField.stringValue]

let stdoutPipe = Pipe()
scriptProcess.standardOutput = stdoutPipe

scriptProcess.launch()
scriptProcess.waitUntilExit()

print("Script exited with status \(scriptProcess.terminationStatus)")

let stdoutData = stdoutPipe.fileHandleForReading.readDataToEndOfFile()
if let stdout = NSString(data: stdoutData, encoding: String.Encoding.utf8.rawValue) {
    print("Received stdout: \(stdout)")
}
```

NB: If the script outputs more data than will fit in the pipe's buffer (which is on the order of 8 kB or so), it'll hang waiting for it to be emptied. For reading large amounts of data, loop over task.isRunning and read to an `NSMutableData` buffer.


### Multithreading (beachballs)

If your script takes more than a couple of seconds to run it's going to block with a beachball. I would recommend adding an NSProgressIndicator (spinner) that you start when the script runs, and well as disabling the button (you'll need an outlet to the button). Then instead of `waitUntilExit()` add a `terminationHandler` with a block of code that stops the spinner and re-enables the button.


### Speak when pressing return

Add an action for spokenTextField and call speakButtonClicked:

```swift
@IBAction func textFieldPressedReturn(_ sender: Any) {
    speakButtonClicked(sender)
}
```


Python Notes
------------

If you try to replicate it by following the [Xcode notes](Presentation/Xcode%20notes.markdown) it'll work in Swift and Objective-C, but in Python you can't use control clicking in the assistant editor to connect outlets and actions. Instead you have to define the `IBOutlet()` and `@IBAction` first, add a custom object with the class set to `MainWindowController` to your xib, and then right click on that to make the connections.

You're also going to want to install the [Xcode 6 Cocoa-Python Templates](https://github.com/gregneagle/Xcode6CocoaPythonTemplates).


Links
-----

* I can't recommend [Cocoa Programming: For Mac OS X](https://www.bignerdranch.com/we-write/cocoa-programming/) ([iBooks](https://itunes.apple.com/us/book/cocoa-programming-for-os-x/id986384909?mt=11)) highly enough.
* Apple's [Mac App Programming Guide](https://developer.apple.com/library/content/documentation/General/Conceptual/MOSXAppProgrammingGuide/Introduction/Introduction.html).
* [Xcode docs](http://help.apple.com/xcode/mac/8.0/).
