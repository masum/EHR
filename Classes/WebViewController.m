    //
//  WebViewController.m
//  EHR
//
//  Created by masu on 10/09/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view setBackgroundColor:[UIColor whiteColor]];
	
	webView = [[UIWebView alloc] init];
	CGRect rc = self.view.bounds;
	rc.origin.y += 100;
	webView.frame = rc;
	[self.view addSubview:webView];
	
	UISegmentedControl* seg = [[UISegmentedControl alloc]initWithItems:nil];
	[seg insertSegmentWithTitle: @"Male" atIndex: 0 animated: NO ];
	[seg insertSegmentWithTitle: @"Male" atIndex: 1 animated: NO ];
	seg.frame = CGRectMake(200, 50, 400, 50);
	[self.view addSubview:seg];
	
}

- (void)forurl:(NSString*)urlstring {
	NSURL* url = [NSURL URLWithString:urlstring];
	NSURLRequest* request = [NSURLRequest requestWithURL:url];
	[webView loadRequest:request];
}
- (void)viewDidAppear:(BOOL)animated {
	NSLog(@"viewDidAppender");
	[super viewDidAppear:animated];
	
//	[self forurl:@"http://www.google.com/"];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
	

	/*
	NSString* path;
	if ([[NSBundle mainBundle] pathForResource:@"mickey_08_1024" ofType:@"jpg"]) {
		NSData* data = [NSData dataWithContentsOfFile:path];
		[webView loadData:data MIMEType:@"image/jpeg" textEncodingName:nil baseURL:nil];
	}
	*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
	[webView dealloc];
    [super dealloc];
}


@end
