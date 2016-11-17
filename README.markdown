Build your first Mac app with Xcode
===================================

Here are the slides and the demo app I built during my MacTech 2016 presentation, Build your first Mac app with Xcode. I built the app in Swift during the talk, but I've also added Objective-C and Python versions in this repo.


Python Notes
------------

If you try to replicate it by following the [Xcode notes](Presentation/Xcode%20notes.markdown) it'll work in Swift and Objective-C, but in Python you can't use control clicking in the assistant editor to connect outlets and actions. Instead you have to define the `IBOutlet()` and `@IBAction` first, add a custom object with the class set to `MainWindowController` to your xib, and then right click on that to make the connections.

You're also going to want to install the [Xcode 6 Cocoa-Python Templates](https://github.com/gregneagle/Xcode6CocoaPythonTemplates).
