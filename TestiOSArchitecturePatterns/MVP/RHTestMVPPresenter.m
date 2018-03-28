//
//  RHTestMVPPresenter.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestMVPPresenter.h"
#import "RHTestMVPModel.h"
#import "RHTestMVPCollectionViewCell.h"

static NSString* const kCellIdentity = @"kCellIdentity";

@interface RHTestMVPPresenter () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    UICollectionView *_collectionView;
    NSMutableArray *_dataSources;
}

@end

@implementation RHTestMVPPresenter

- (instancetype)initWithView:(RHTestMVPViewController *)view {
    self = [super init];
    if (self) {
        _collectionView = view.collectionView;
        [self setupCollectionView];
        [self loadData];
    }
    return self;
}

- (void)setupCollectionView {
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"RHTestMVPCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kCellIdentity];
}

- (void)reloadCollectionView {
    [self loadData];
}

- (void)loadData {
    _dataSources = [NSMutableArray new];
    for (int i = 0; i < 100; i++) {
        RHTestMVPModel *model = [RHTestMVPModel new];
        model.name = @"Test";
        model.imgURL = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
        [_dataSources addObject:model];
    }
    [_collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RHTestMVPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentity forIndexPath:indexPath];
    
    [cell configCellWithModel:_dataSources[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
