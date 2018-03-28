//
//  RHTestMVPViewController.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestMVPViewController.h"
#import "RHTestMVPPresenter.h"

@interface RHTestMVPViewController () {
    RHTestMVPPresenter *_presenter;
}

@end

@implementation RHTestMVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _presenter = [[RHTestMVPPresenter alloc] initWithView:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_presenter reloadCollectionView];
}

@end
