//
//  AppDelegate.m
//  MacTech Demo
//
//  Created by Pelle on 2016-11-14.
//  Copyright © 2016 MacTech. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()

@property MainWindowController *mainWindowController;
    
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindowController"];
    [self.mainWindowController showWindow:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
