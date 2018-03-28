//
//  RHTestMVPPresenter.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestVIPERPresenter.h"
#import "RHTestVIPERCollectionViewCell.h"
#import "RHTestVIPERInteractor.h"

static NSString* const kCellIdentity = @"kCellIdentity";

@interface RHTestVIPERPresenter () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    UICollectionView *_collectionView;
    NSMutableArray *_dataSources;
    RHTestVIPERInteractor *_interatcor;
}

@end

@implementation RHTestVIPERPresenter

- (instancetype)initWithView:(RHTestVIPERViewController *)view {
    self = [super init];
    if (self) {
        _collectionView = view.collectionView;
        [self setupCollectionView];
        
        __weak __typeof(self)weakSelf = self;
        _interatcor = [[RHTestVIPERInteractor alloc] initWithDataChangedBlock:^(NSMutableArray *arr) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            strongSelf->_dataSources = arr;
            [strongSelf->_collectionView reloadData];
        }];
    }
    return self;
}

- (void)setupCollectionView {
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"RHTestVIPERCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kCellIdentity];
}

- (void)reloadCollectionView {
    [_interatcor reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RHTestVIPERCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentity forIndexPath:indexPath];
    
    [cell configCellWithModel:_dataSources[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
