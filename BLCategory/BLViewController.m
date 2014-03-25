//
//  BLViewController.m
//  BLCategory
//
//  Created by Loganathan on 25/03/14.
//  Copyright (c) 2014 Loganathan. All rights reserved.
//

#import "BLViewController.h"
#import "UIButton+BLOptions.h"

@interface BLViewController ()

@end

@implementation BLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 80, 150, 40);
    [button setTitle:@"Rounded" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor greenColor];

    [button setBorderColor:[UIColor redColor]];
    [button setFillColor:[UIColor orangeColor]];
    [button drawRoundedSidesWithBorderWidth:4.0F];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
