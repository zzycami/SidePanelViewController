//
//  SidePanelViewController.m
//  SidePanelViewController
//
//  Created by damingdan on 15/3/25.
//  Copyright (c) 2015年 kuteng. All rights reserved.
//

#import "SidePanelViewController.h"
#import "Masonry.h"

@interface SidePanelViewController ()
@property(nonatomic, retain) UIView* leftPanel;
@property(nonatomic, retain) UIView* contentPanel;
@end

@implementation SidePanelViewController
@synthesize leftPanel = _leftPanel;
@synthesize leftPanelViewController = _leftPanelViewController;
@synthesize contentPanel = _contentPanel;
@synthesize contentPanelViewController = _contentPanelViewController;


- (instancetype) initWithLeftPanel:(UIViewController*) leftPanel contentPanel:(UIViewController*) contentPanel {
    if (self = [super init]) {
        _leftPanelViewController = leftPanel;
        _contentPanelViewController = contentPanel;
        [self addChildViewController:_leftPanelViewController];
        [self addChildViewController:_contentPanelViewController];
    }
    return self;
}

- (void) setupSidePanelViewController {
    // Create the panel view
    _leftPanel = UIView.new;
    _contentPanel = UIView.new;
    
    UIColor* lightGreenColor = [UIColor colorWithRed:0.784 green:0.992 blue:0.851 alpha:1];
    _leftPanel.backgroundColor = lightGreenColor;
    
    UIColor *pinkColor = [UIColor colorWithRed:0.992 green:0.804 blue:0.941 alpha:1];
    _contentPanel.backgroundColor = pinkColor;
    
    
    [self.view addSubview:_leftPanel];
    [_leftPanel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.and.left.equalTo(self.view);
    }];
    
    [self.view addSubview:_contentPanel];
    [_contentPanel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.and.right.equalTo(self.view);
        make.left.equalTo(_leftPanel.mas_right);
        make.width.equalTo(_leftPanel.mas_width).multipliedBy(2);
    }];
    
    // Add the content to panel views
    UIView* leftPanelView = _leftPanelViewController.view;
    [_leftPanel addSubview:leftPanelView];
    [leftPanelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_leftPanel);
    }];
    
    UIView* contentPanelView = _contentPanelViewController.view;
    [_contentPanel addSubview:contentPanelView];
    [contentPanelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_contentPanel);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSidePanelViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Change the content view controller
- (void) setContentPanelViewController:(UIViewController *)viewController withAnimation:(BOOL)animation reverse:(BOOL)reverse completion:(void (^)(BOOL))completion {
    if (viewController == nil || _contentPanelViewController == viewController) {
        return;
    }
    UIView* prevView = self.contentPanelViewController.view;
    UIView* curView = viewController.view;
    [_contentPanel addSubview:curView];
    [curView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contentPanel.mas_left);
        make.right.equalTo(_contentPanel.mas_right);
        make.bottom.equalTo(_contentPanel.mas_top);
        make.size.equalTo(_contentPanel);
    }];
    [_contentPanel setNeedsUpdateConstraints];
    
    [prevView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_contentPanel.mas_top);
        make.left.equalTo(_contentPanel.mas_left);
        make.right.equalTo(_contentPanel.mas_right);
    }];
    [curView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_contentPanel);
    }];
    [_contentPanel updateConstraintsIfNeeded];
    [UIView animateWithDuration:[self transitionDuration] animations:^{
        [_contentPanel layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (_contentPanelViewController) {
            [_contentPanelViewController.view removeFromSuperview];
            [_contentPanelViewController removeFromParentViewController];
        }
        _contentPanelViewController = viewController;
        completion(finished);
    }];
}

- (NSTimeInterval) transitionDuration {
    return 0.2;
}

- (void) setContentPanelViewController:(UIViewController *)contentPanelViewController {
    if (contentPanelViewController == nil || _contentPanelViewController == contentPanelViewController) {
        return;
    }
    
    // Remove prev view controller
    if (_contentPanelViewController) {
        [_contentPanelViewController.view removeFromSuperview];
        [_contentPanelViewController removeFromParentViewController];
    }
    
    
    // Add new view controller
    _contentPanelViewController = contentPanelViewController;
    UIView* contentPanelView = _contentPanelViewController.view;
    [_contentPanel addSubview:contentPanelView];
    [contentPanelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_contentPanel);
    }];
}

@end
