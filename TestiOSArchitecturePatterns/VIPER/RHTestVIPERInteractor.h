//
//  RHTestVIPERInteractor.h
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/28.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^kVIPERDataChangedBlock)(NSMutableArray *arr);

@interface RHTestVIPERInteractor : NSObject

- (instancetype)initWithDataChangedBlock:(kVIPERDataChangedBlock)block;
- (void)reloadData;

@end
