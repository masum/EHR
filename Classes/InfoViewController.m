    //
//  InfoViewController.m
//  EHR
//
//  Created by masu on 10/09/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"


@implementation InfoViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view setBackgroundColor:[UIColor whiteColor]];
	
	UIButton* button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.titleLabel.font = [UIFont systemFontOfSize:30];
	[button setFrame:CGRectMake(300, 700, 200, 50)];
	[button setTitle:@"戻る" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton:) 
	 forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
}

- (IBAction)clickButton:(UIButton*)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
