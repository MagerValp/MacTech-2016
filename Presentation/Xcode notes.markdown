# MacTech Demo app

* Create a new project
    * Cocoa Application
    * `MacTech Demo`
    * `MacTech`
    * `com.mactech`
    * Swift
    * No Storyboards or tests
    * No git
* Project structure
    * MacTech Demo.app
    * `Info.plist`
    * `MainMenu.xib`
        * An interface builder document that contains the main menu
    * `Assets.xcassets`
        * Add icons
    * `AppDelegate.swift`
* Target Settings
    * Identity
    * Signing
        * If we have time at the end and wifi works
        * It used to be a pain in the butt, but with Xcode8 it's a lot nicer
    * Deployment Info
        * Deployment Target

## Add UI & Controller

You can start with either the model or the view. I'm going to start with the view since it's satisfying to see something up on the screen.

* File -> New -> File…
    * Cocoa class
    * MainWindowController
    * Also create XIB file for UI
    * Group: MacTech Demo
    * Targets: MacTech Demo
* `MainWindowController.xib`
    * Window
        * Attributes inspector
            * Title: Swede-o-tron
            * Uncheck resize
    * Object Library
        * NSButton
        * NSTextField
* Connect to controller
    * We want to connect our view objects here, to the controller code here
    * Easiest way is the Assistant editor that will show us two related files
    * Select xib
    * Assistant Editor
    * Got crowded, hide navigator and utilities
    * Control click from `NSTextField` to `MainWindowController`
        * Outlet
        * `spokenTextField`
    * Control click from `NSButton` to `MainWindowController`
        * Action
        * `speakButtonClicked`
    * Go back to standard editor
* `MainWindowController.swift`
    * `print("Speak button clicked")`
    * `print("\(spokenTextField)")`


## Build and run

* Not what we want
* Our window is missing


## Connect MainWindowController to AppDelegate

* `MainMenu.xib`
    * Remove Window
* `AppDelegate.swift`
    * Remove window outlet
    * `var mainWindowController: MainWindowController?`
    * `applicationDidFinishLaunching`
        * `self.mainWindowController = MainWindowController(windowNibName: "MainWindowController")`
        * `self.mainWindowController?.showWindow(self)`
    * xib -> nib


## Build and run

* NSTextField object address, not what we want


## spokenTextField.stringValue

* `MainWindowController.swift`
    * `spokenTextField`
        * Help
        * The parent class, NSControl, provides the methods for setting the values of the text field, for example: stringValue, doubleValue, etc.. There are corresponding methods to retrieve values.
        * `spokenTextField.stringValue`


## Build and run

* View done
* controller acts as expected
* ready to add model


## Add model

* File -> New -> File…
    * If we were creating the model in Swift, we could just add a Swift file, write a function, and call that from the controller
    * Shell Script
        * Script.sh
        * Group: MacTech Demo
        * Targets: MacTech Demo
    * Script.sh
        * `echo "Script running with args '$@'"`
        * `say -v Alva "$@"`
        * `exit 0`
    * How do we run that from the controller?
    * Google "cocoa run shell script"
        * NSTask
            * Swift
            * Process instead of NSTask
            * Apple has started cleaning up and renaming APIs
            * Most just strip the NS prefix
                * NextStep
    * `speakButtonClicked`
        * `//         let scriptProcess = Process.launchedProcess(launchPath: <#T##String#>, arguments: [spokenTextField.stringValue])`
    * How do we find the path to Script.sh?
    * NSBundle -> Bundle
    * `let scriptPath = Bundle.main.path(forResource: "Script", ofType: "sh")`
    * `let scriptProcess = Process.launchedProcess(launchPath: scriptPath, arguments: [spokenTextField.stringValue])`
    * optional
        * `Bundle.main.path(forResource` help
        * String with a question mark
        * Means that either it returns a string, or it returns nothing
        * Most languages like Objective-C and Python don't tell you, you're just supposed to know that it's nil or None
        * Swift forces you to handle optionals
        * Easiest way is to add an if clause
    * `if let scriptPath = Bundle.main.path(forResource: "Script", ofType: "sh") {`
    * `scriptProcess.waitUntilExit()`


## Build and run

* Crash on click
* launch path not accessible
* `MacTech Demo.app`
    * Show in Finder
    * Show package contents
    * `Script.sh` is in Resources, but not executable
* A couple of ways to fix that, none of them easy or intuitive


## Add Build Phase with chmod

* MacTech Demo target settings
    * Build Phases
        * Compile Sources
        * Copy Bundle Resources
            * No options for copy
        * New Run Script Phase
            * `env | sort`
            * `exit 1`
        * Build and fail
        * Click on error to jump to build log
        * Filter on /Resources
            * `UNLOCALIZED_RESOURCES_FOLDER_PATH`
        * Filter on target
            * `TARGET_BUILD_DIR`
        * Run Script
            * `chmod +x "$TARGET_BUILD_DIR/$UNLOCALIZED_RESOURCES_FOLDER_PATH/Script.sh"`


## Build and run

* Success!


## Export app

* Product -> Archive
* Organizer Window
    * Export…
    * Export as a macOS App




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


class MainWindowController: NSWindowController {

    @IBOutlet weak var spokenTextField: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func speakButtonClicked(_ sender: Any) {
        print("Speak button clicked")
        print("\(spokenTextField.stringValue)")
        
        if let scriptPath = Bundle.main.path(forResource: "Script", ofType: "sh") {
            let scriptProcess = Process.launchedProcess(launchPath: scriptPath, arguments: [spokenTextField.stringValue])
            scriptProcess.waitUntilExit()
        } else {
            print("Couldn't find Script.sh")
        }
        
    }
    
}


echo "Script running with args '$@'"
say -v Alva "$@"

exit 0


chmod +x "$TARGET_BUILD_DIR/$UNLOCALIZED_RESOURCES_FOLDER_PATH/Script.sh"


## Bonus: Code signing



## Bonus: Create pkg when archiving

* Product -> Scheme -> Edit Scheme…
    * Archive -> Post-actions
* `archive_pkg.sh`
