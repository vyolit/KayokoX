//
//  main.m
//  KayokoX
//
//  Created by Alexandra Aurora Göttlicher
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSArray* runningApplications = [[NSWorkspace sharedWorkspace] runningApplications];
        BOOL isRunning = NO;

        for (NSUInteger i = 0; i < [runningApplications count]; i++) {
            NSRunningApplication* application = runningApplications[i];
            if ([[application bundleIdentifier] isEqualToString:@"codes.aurora.KayokoX"]) {
                isRunning = YES;
                break;
            }
        }

        if (!isRunning) {
            NSString* path  = [[NSBundle mainBundle] bundlePath];
            for (NSUInteger i = 0; i < 4; i++) {
                path = [path stringByDeletingLastPathComponent];
            }

            NSURL* pathURL = [NSURL fileURLWithPath:path];
            if (pathURL) {
                [[NSWorkspace sharedWorkspace] openApplicationAtURL:pathURL configuration:[NSWorkspaceOpenConfiguration configuration] completionHandler:nil];
            }
        }

        [[NSApplication sharedApplication] terminate:nil];
    }
    return NSApplicationMain(argc, argv);
}
