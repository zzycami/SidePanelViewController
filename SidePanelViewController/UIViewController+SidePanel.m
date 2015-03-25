//
//  UIViewController+SidePanel.m
//  SidePanelViewController
//
//  Created by damingdan on 15/3/25.
//  Copyright (c) 2015年 kuteng. All rights reserved.
//

#import "UIViewController+SidePanel.h"


@implementation UIViewController (SidePanel)

- (SidePanelViewController*) sidePanelController {
    UIViewController* viewController = self.parentViewController;
    while (viewController) {
        if ([viewController isKindOfClass:[SidePanelViewController class]]) {
            return (SidePanelViewController*)viewController;
        }else if(viewController.parentViewController && viewController.parentViewController != viewController) {
            viewController = viewController.parentViewController;
        }else {
            viewController = nil;
        }
    }
    return nil;
}

@end