//
//  UIViewController+SidePanel.h
//  SidePanelViewController
//
//  Created by damingdan on 15/3/25.
//  Copyright (c) 2015年 kuteng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SidePanelViewController.h"

@class SidePanelViewController;

@interface UIViewController (SidePanel)
@property (nonatomic, weak, readonly) SidePanelViewController *sidePanelController;
@end