//
//  RHTestMVCCollectionViewCell.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestVIPERCollectionViewCell.h"

@interface RHTestVIPERCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation RHTestVIPERCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configCellWithModel:(RHTestMVPModel *)model {
    self.imageView.image = [UIImage imageWithContentsOfFile:model.imgURL];
    self.nameLabel.text = model.name;
}

@end
