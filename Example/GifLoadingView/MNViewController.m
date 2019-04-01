//
//  MNViewController.m
//  GifLoadingView
//
//  Created by wxf on 03/31/2019.
//  Copyright (c) 2019 wxf. All rights reserved.
//

#import "MNViewController.h"
#import "MNGifLoadingView.h"

@interface MNViewController ()

@end

@implementation MNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)gifLoading:(UIButton *)sender {
    [MNGifLoadingView startLoadingWithGifImageName:@"loading"];// andType:SVProgressHUDMaskTypeBlack];
}

- (IBAction)gitUpload:(UIButton *)sender {
    [MNGifLoadingView startLoadingWithGifImageName:@"upload" andType:SVProgressHUDMaskTypeGradient];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [MNGifLoadingView endLoading];
}
@end
