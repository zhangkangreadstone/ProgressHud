//
//  ViewController.m
//  Tool
//
//  Created by LSH on 16/1/12.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import "ViewController.h"
#import "ProgressHud.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ProgressHud *hud = [[ProgressHud alloc]initWithFrame:CGRectMake(40, 120, 120, 120)];
    [hud setHaveNotHudBackColor:[UIColor lightGrayColor] andHaveDidBackColor:[UIColor blueColor] withLineWidth:5 andTitleFont:[UIFont systemFontOfSize:24] andTitleColor:[UIColor blueColor]];
    [hud setProgressHudValue:0.96 withpointLength:2];
    [self.view addSubview:hud];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
