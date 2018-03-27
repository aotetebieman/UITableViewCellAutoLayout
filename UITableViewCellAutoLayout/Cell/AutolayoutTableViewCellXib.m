//
//  AutolayoutTableViewCellXib.m
//  UITableViewCellAutoLayout
//
//  Created by 卢会旭 on 2018/3/27.
//  Copyright © 2018年 卢会旭. All rights reserved.
//

#import "AutolayoutTableViewCellXib.h"

@implementation AutolayoutTableViewCellXib

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(CellModel *)model {
    self.user.text = model.user;
    self.content.text = model.content;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
