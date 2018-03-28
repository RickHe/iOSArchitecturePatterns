//
//  RHTestMVPViewController.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestMVVMViewController.h"
#import "RHTestMVVMViewModel.h"
#import "RHTestMVVMCollectionViewCell.h"

static NSString* const kCellIdentity = @"kCellIdentity";

@interface RHTestMVVMViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    RHTestMVVMViewModel *_viewModel;
    NSMutableArray *_dataSources;
}

@end

@implementation RHTestMVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
    
    __weak __typeof(self)weakSelf = self;
    _viewModel = [[RHTestMVVMViewModel alloc] initWithModelChangedBlock:^(NSMutableArray *arr) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf->_dataSources = arr;
        [strongSelf->_collectionView reloadData];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setupCollectionView {
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"RHTestMVVMCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kCellIdentity];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RHTestMVVMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentity forIndexPath:indexPath];
    
    [cell configCellWithModel:_dataSources[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
