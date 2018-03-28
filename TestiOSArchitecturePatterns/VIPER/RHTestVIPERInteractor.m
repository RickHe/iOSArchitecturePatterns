//
//  RHTestVIPERInteractor.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/28.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestVIPERInteractor.h"
#import "RHTestVIPERModel.h"

@interface RHTestVIPERInteractor () {
    kVIPERDataChangedBlock _block;
}

@end

@implementation RHTestVIPERInteractor

- (instancetype)initWithDataChangedBlock:(kVIPERDataChangedBlock)block {
    self = [super init];
    if (self) {
        _block = block;
    }
    return self;
}

- (void)reloadData {
    [self loadData];
}

- (void)loadData {
    NSMutableArray *datas = [NSMutableArray new];
    for (int i = 0; i < 100; i++) {
        RHTestVIPERModel *model = [RHTestVIPERModel new];
        model.name = @"Test";
        model.imgURL = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
        [datas addObject:model];
    }
    
    if (_block) {
        _block(datas);
    }
}

@end
