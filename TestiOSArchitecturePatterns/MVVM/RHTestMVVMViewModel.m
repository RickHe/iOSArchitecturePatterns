//
//  RHTestMVPPresenter.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestMVVMViewModel.h"
#import "RHTestMVVMModel.h"

@interface RHTestMVVMViewModel ()  {
    kMVVMModelChangedBlock _block;
    NSMutableArray *_dataSources;
}

@end

@implementation RHTestMVVMViewModel

- (instancetype)initWithModelChangedBlock:(kMVVMModelChangedBlock)block {
    self = [super init];
    if (self) {
        _block = block;
        [self loadData];
    }
    return self;
}

- (void)reloadCollectionView {
    [self loadData];
}

- (void)loadData {
    _dataSources = [NSMutableArray new];
    for (int i = 0; i < 100; i++) {
        RHTestMVVMModel *model = [RHTestMVVMModel new];
        model.name = @"Test";
        model.imgURL = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
        [_dataSources addObject:model];
    }
    
    if (_block) {
        _block(_dataSources);
    }
}



@end
