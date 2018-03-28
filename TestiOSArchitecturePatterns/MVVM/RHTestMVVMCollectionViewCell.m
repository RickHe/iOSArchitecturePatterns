//
//  RHTestMVCCollectionViewCell.m
//  TestiOSArchitecturePatterns
//
//  Created by DaFenQI on 2018/3/27.
//  Copyright © 2018年 DaFenQI. All rights reserved.
//

#import "RHTestMVVMCollectionViewCell.h"

@interface RHTestMVVMCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation RHTestMVVMCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configCellWithModel:(RHTestMVPModel *)model {
    self.imageView.image = [UIImage imageWithContentsOfFile:model.imgURL];
    self.nameLabel.text = model.name;
}

@end
