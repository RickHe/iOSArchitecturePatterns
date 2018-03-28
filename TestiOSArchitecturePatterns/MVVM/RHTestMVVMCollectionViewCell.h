//
//  RHTestMVCCollectionViewCell.h
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHTestMVPModel.h"

@interface RHTestMVVMCollectionViewCell : UICollectionViewCell

- (void)configCellWithModel:(RHTestMVPModel *)model;

@end
