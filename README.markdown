Build your first Mac app with Xcode
===================================

Here are the slides (with speaker notes) and the demo app I built during my MacTech 2016 presentation, Build your first Mac app with Xcode. I built the app in Swift during the talk, but I've also added Objective-C and Python versions in this repo.


Python Notes
------------

If you try to replicate it by following the [Xcode notes](Presentation/Xcode%20notes.markdown) it'll work in Swift and Objective-C, but in Python you can't use control clicking in the assistant editor to connect outlets and actions. Instead you have to define the `IBOutlet()` and `@IBAction` first, add a custom object with the class set to `MainWindowController` to your xib, and then right click on that to make the connections.

You're also going to want to install the [Xcode 6 Cocoa-Python Templates](https://github.com/gregneagle/Xcode6CocoaPythonTemplates).


Links
-----

* I can't recommend [Cocoa Programming: For Mac OS X](https://www.bignerdranch.com/we-write/cocoa-programming/) ([iBooks](https://itunes.apple.com/us/book/cocoa-programming-for-os-x/id986384909?mt=11)) highly enough.
* Apple's [Mac App Programming Guide](https://developer.apple.com/library/content/documentation/General/Conceptual/MOSXAppProgrammingGuide/Introduction/Introduction.html).
* [Xcode docs](http://help.apple.com/xcode/mac/8.0/).
