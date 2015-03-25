//
//  SidePanelViewController.h
//  SidePanelViewController
//
//  Created by damingdan on 15/3/25.
//  Copyright (c) 2015年 kuteng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidePanelViewController : UIViewController
@property(nonatomic, retain) UIViewController* leftPanelViewController;

@property(nonatomic, retain) UIViewController* contentPanelViewController;

- (void) setContentPanelViewController:(UIViewController *)viewController withAnimation:(BOOL) animation reverse:(BOOL) reverse completion:(void (^)(BOOL finished))completion;

- (instancetype) initWithLeftPanel:(UIViewController*) leftPanel contentPanel:(UIViewController*) contentPanel;
@end
