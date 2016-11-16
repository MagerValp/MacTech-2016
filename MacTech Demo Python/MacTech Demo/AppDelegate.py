# -*- coding: utf-8 -*-
#
#  AppDelegate.py
#  MacTech Demo
#
#  Created by Pelle on 2016-11-14.
#  Copyright (c) 2016 MacTech. All rights reserved.
#

from Foundation import *
from AppKit import *
from MainWindowController import *

class AppDelegate(NSObject):
    
    mainWindowController = None
    
    def applicationDidFinishLaunching_(self, sender):
        self.mainWindowController = MainWindowController.alloc().initWithWindowNibName_(u"MainWindowController")
        self.mainWindowController.showWindow_(self)

