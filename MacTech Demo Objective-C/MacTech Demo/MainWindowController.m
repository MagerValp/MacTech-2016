//
//  MainWindowController.m
//  MacTech Demo
//
//  Created by Pelle on 2016-11-14.
//  Copyright © 2016 MacTech. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()
    
    @property (weak) IBOutlet NSTextField *spokenTextField;

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

    
- (IBAction)speakButtonClicked:(NSButton *)sender {
    NSLog(@"Speak button clicked");
    NSLog(@"%@", self.spokenTextField.stringValue);
    
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"Script" ofType:@"sh"];
    if (scriptPath) {
        NSTask *scriptProcess = [NSTask launchedTaskWithLaunchPath:scriptPath arguments:@[self.spokenTextField.stringValue]];
        [scriptProcess waitUntilExit];
    } else {
        NSLog(@"Couldn't find Script.sh");
    }
    
}
    
    
@end
