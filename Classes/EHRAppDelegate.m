//
//  EHRAppDelegate.m
//  EHR
//
//  Created by masu on 10/09/04.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "EHRAppDelegate.h"
#import "TopViewController.h"

@implementation EHRAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	topView = [[[TopViewController alloc] init] autorelease];
	UINavigationController* top = [[UINavigationController alloc] initWithRootViewController:topView];
	
	[window addSubview:top.view];

	[window makeKeyAndVisible];
}


- (void)dealloc {
	[topView release];
    [window release];
    [super dealloc];
}


@end
