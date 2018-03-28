//
//  RHTestMVPPresenter.h
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RHTestMVPViewController.h"

typedef void(^kMVVMModelChangedBlock)(NSMutableArray *arr);

@interface RHTestMVVMViewModel : NSObject

- (instancetype)initWithModelChangedBlock:(kMVVMModelChangedBlock)block;
- (void)reloadCollectionView;

@end
