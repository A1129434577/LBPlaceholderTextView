//
//  ViewController.m
//  LBTextFieldDemo
//
//  Created by 刘彬 on 2019/9/24.
//  Copyright © 2019 刘彬. All rights reserved.
//

#import "ViewController.h"
#import "LBPlaceholderTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"LBPlaceholderTextView";
    LBPlaceholderTextView *placeholderTextView = [[LBPlaceholderTextView alloc] initWithFrame:CGRectMake(20, 200, CGRectGetWidth(self.view.frame)-20*2, 60)];
    placeholderTextView.backgroundColor = [UIColor cyanColor];
    placeholderTextView.lb_placeholderColor = [UIColor redColor];
    placeholderTextView.font = [UIFont systemFontOfSize:17];
    placeholderTextView.lb_maxLength = @20;
    placeholderTextView.lb_placeholder = @"请输入";
    [self.view addSubview:placeholderTextView];
}

@end
