//  nugit.m
//
//  Created by Patrick Thomson on 2008-03-11.
//  Copyright (c) 2008 Patrick Thomson. Released to the public under the Apache license.
//

#import <Cocoa/Cocoa.h>
#import <Nu/Nu.h>

static int loadNuFiles(NSString *bundleIdentifier, NSString *mainFile)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSBundle *bundle = [NSBundle bundleWithIdentifier:bundleIdentifier];
    NSString *main_path = [bundle pathForResource:mainFile ofType:@"nu"];
    if (main_path) {
        NSString *main = [NSString stringWithContentsOfFile:main_path];
        if (main) {
	    id parser = [Nu parser];
            id script = [parser parse: main];
            id result = [script evalWithContext:[parser context]];
        }
    }
    [pool release];
    return 0;
}

void nugitInit()
{
    static initialized = 0;
    if (!initialized) {
        initialized = 1;
        loadNuFiles(@"nu.programming.nugit", @"nugit");
    }
}