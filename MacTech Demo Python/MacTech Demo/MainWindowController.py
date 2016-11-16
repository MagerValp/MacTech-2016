# -*- coding: utf-8 -*-
#
#  MainWindowController.py
#  MacTech Demo
#
#  Created by Pelle on 2016-11-14.
#  Copyright (c) 2016 MacTech. All rights reserved.
#

from objc import YES, NO, IBAction, IBOutlet
from Foundation import *
from AppKit import *

class MainWindowController(NSWindowController):

    spokenTextField = IBOutlet()

    @IBAction
    def speakButtonClicked_(self, sender):
        NSLog(u"Speak button clicked")
        NSLog(self.spokenTextField.stringValue())
        scriptPath = NSBundle.mainBundle().pathForResource_ofType_(u"Script", u"sh")
        if scriptPath:
            scriptProcess = NSTask.launchedTaskWithLaunchPath_arguments_(scriptPath, [self.spokenTextField.stringValue()])
            scriptProcess.waitUntilExit()
        else:
            NSLog(u"Couldn't find Script.sh")


