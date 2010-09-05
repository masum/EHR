    //
//  TopViewController.m
//  EHR
//
//  Created by masu on 10/09/04.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TopViewController.h"
#import "InfoViewController.h"
#import "WebViewController.h"


#define BUTTON01 0
#define BUTTON02 1
#define BUTTON03 2
#define BUTTON04 3
#define BUTTON_INFORMATION 4

@implementation TopViewController

- (UIButton*)makeButton:(CGRect)rect text:(NSString*)text tag:(int)tag {
    //テキストボタンの生成
    UIButton* button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.titleLabel.font = [UIFont systemFontOfSize:36];
    [button setFrame:rect];
	button.alpha=0.7;
	[button setTitle:text forState:UIControlStateNormal];
    [button setTag:tag];
    [button addTarget:self action:@selector(clickButton:) 
	 forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// 背景色設定
	[self.view setBackgroundColor:[UIColor whiteColor]];
	
	// タイトル設定
	self.title = @"診療記録トップ";

	// インフォメーションボタン生成
	UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight]; 
	[infoButton setTag:BUTTON_INFORMATION];
	[infoButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside]; 
	
	// ナビゲーションバーの左ボタンとしてインフォメーションボタンを登録
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
	
	// 背景画像生成＆設定
	UIImageView* bgImage = [[UIImageView alloc] init];
	[bgImage setImage:[UIImage imageNamed:@"mickey_08_1024.jpg"]];
	[bgImage setFrame:self.view.bounds];
	[self.view addSubview:bgImage];
	[bgImage release];
	
	// ロゴ生成＆設定
	UIImageView* logo = [[UIImageView alloc] init];
	[logo setImage:[UIImage imageNamed:@"logo03.png"]];
	[logo setFrame:CGRectMake(50, 100, 700, 200)];
	[self.view addSubview:logo];
	[logo release];
	
	// ナビゲーションバーを半透明に（selfはUIViewController）
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
	self.navigationController.navigationBar.translucent = YES;
	
	// ツールバーを半透明に（selfはUIViewController）
	self.navigationController.toolbar.barStyle = UIBarStyleBlack;
	self.navigationController.toolbar.translucent = YES;
	
	// ステータスバーの半透明化
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;

	// 各種ボタン配置
	CGRect rc = CGRectMake(400,600,350,80);
	UIButton* btn01 = [self makeButton:rc text:@"診療記録" tag:BUTTON01];
	rc.origin.y += 90;
	UIButton* btn02 = [self makeButton:rc text:@"顧客管理" tag:BUTTON02];
	rc.origin.y += 90;
	UIButton* btn03 = [self makeButton:rc text:@"統計" tag:BUTTON03];
	rc.origin.y += 90;
	UIButton* btn04 = [self makeButton:rc text:@"各種設定" tag:BUTTON04];

	[self.view addSubview:btn01];
	[self.view addSubview:btn02];
	[self.view addSubview:btn03];
	[self.view addSubview:btn04];
}
- (IBAction)clickButton:(UIButton*)sender {
	if (sender.tag == BUTTON01) {
		NSLog(@"button01");
	} else if (sender.tag == BUTTON03) {
		WebViewController* web = [[WebViewController alloc] init];
		[self.navigationController pushViewController:web animated:YES];
		
	} else if (sender.tag == BUTTON_INFORMATION) {
		InfoViewController* info = [[[InfoViewController alloc] init] autorelease];
		info.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
		[self presentModalViewController:info animated:YES];
	}

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}

- (void)dealloc {
	[super dealloc];
}
@end
