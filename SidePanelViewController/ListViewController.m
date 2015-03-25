//
//  ListViewController.m
//  SidePanelViewController
//
//  Created by damingdan on 15/3/25.
//  Copyright (c) 2015年 kuteng. All rights reserved.
//

#import "ListViewController.h"
#import "UIViewController+SidePanel.h"
#import "Masonry.h"
#import "ContentViewController.h"

static NSString* CellIdentifier = @"TableViewCell";

@interface TableViewDataSource : NSObject<UITableViewDataSource>
@property(nonatomic, retain) NSArray* dataSource;
@end

@interface ListViewController ()<UITableViewDelegate>
@property(nonatomic, retain) UITableView* tableView;

@property(nonatomic, retain) TableViewDataSource* dataSource;

@property(nonatomic, retain) NSArray* viewControllers;
@end

@implementation ListViewController
@synthesize tableView = _tableView;
@synthesize dataSource = _dataSource;
@synthesize viewControllers = _viewControllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = UITableView.new;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *topLayoutGuide = (id)self.topLayoutGuide;
        make.top.equalTo(topLayoutGuide.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    _dataSource = TableViewDataSource.new;
    _tableView.dataSource = _dataSource;
    _tableView.delegate = self;
    _tableView.scrollEnabled = NO;
    
    
    ContentViewController* item1ViewController = [[ContentViewController alloc] init];
    item1ViewController.title = @"This is the item1 view controller";
    item1ViewController.view.backgroundColor = [UIColor blueColor];
    
    ContentViewController* item2ViewController = [[ContentViewController alloc] init];
    item2ViewController.title = @"This is the item2 view controller";
    item2ViewController.view.backgroundColor = [UIColor yellowColor];
    
    ContentViewController* item3ViewController = [[ContentViewController alloc] init];
    item3ViewController.title = @"This is the item3 view controller";
    item3ViewController.view.backgroundColor = [UIColor lightGrayColor];
    
    ContentViewController* item4ViewController = [[ContentViewController alloc] init];
    item4ViewController.title = @"This is the item4 view controller";
    item4ViewController.view.backgroundColor = [UIColor purpleColor];
    
    _viewControllers = @[item1ViewController, item2ViewController, item3ViewController, item4ViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //self.sidePanelController.contentPanelViewController = _viewControllers[indexPath.row];
    [self.sidePanelController setContentPanelViewController:_viewControllers[indexPath.row] withAnimation:YES reverse:YES completion:^(BOOL finished) {
        
    }];
}

@end



@implementation TableViewDataSource
@synthesize dataSource = _dataSource;

- (NSArray*) dataSource {
    if (!_dataSource) {
        _dataSource = @[@"Item1", @"Item2", @"Item3", @"item4"];
    }
    return _dataSource;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

@end