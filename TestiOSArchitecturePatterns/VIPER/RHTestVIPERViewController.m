//
//  RHTestMVPViewController.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestVIPERViewController.h"
#import "RHTestVIPERPresenter.h"

@interface RHTestVIPERViewController () {
    RHTestVIPERPresenter *_presenter;
}

@end

@implementation RHTestVIPERViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _presenter = [[RHTestVIPERPresenter alloc] initWithView:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_presenter reloadCollectionView];
}

@end
