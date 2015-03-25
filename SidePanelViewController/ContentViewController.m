//
//  ContentViewController.m
//  SidePanelViewController
//
//  Created by damingdan on 15/3/25.
//  Copyright (c) 2015年 kuteng. All rights reserved.
//

#import "ContentViewController.h"
#import "Masonry.h"

@interface ContentViewController ()
@property(nonatomic, retain) UILabel* titleLabel;
@end

@implementation ContentViewController
@synthesize titleLabel = _titleLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleLabel = UILabel.new;
    [self.view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    _titleLabel.text = self.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
