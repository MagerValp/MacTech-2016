# -*- coding: utf-8 -*-
#
#  main.py
#  MacTech Demo
#
#  Created by Pelle on 2016-11-14.
#  Copyright (c) 2016 MacTech. All rights reserved.
#

# import modules required by application
import objc
import Foundation
import AppKit

from PyObjCTools import AppHelper

# import modules containing classes required to start application and load MainMenu.nib
import AppDelegate

# pass control to AppKit
AppHelper.runEventLoop()
