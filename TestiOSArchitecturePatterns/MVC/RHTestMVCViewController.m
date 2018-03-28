//
//  RHTestMVCViewController.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestMVCViewController.h"
#import "RHTestMVCModel.h"
#import "RHTestMVCCollectionViewCell.h"

static NSString* const kCellIdentity = @"kCellIdentity";

@interface RHTestMVCViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    NSMutableArray *_dataSources;
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation RHTestMVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
    [self loadData];
}

- (void)loadData {
    _dataSources = [NSMutableArray new];
    for (int i = 0; i < 100; i++) {
        RHTestMVCModel *model = [RHTestMVCModel new];
        model.name = @"Test";
        model.imgURL = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
        [_dataSources addObject:model];
    }
    [self.collectionView reloadData];
}

- (void)setupCollectionView {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"RHTestMVCCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kCellIdentity];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RHTestMVCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentity forIndexPath:indexPath];
    
    [cell configCellWithModel:_dataSources[indexPath.row]];
    
    return cell;
}

@end
