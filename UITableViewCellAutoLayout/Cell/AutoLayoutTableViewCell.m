//
//  AutoLayoutTableViewCell.m
//  UITableViewCellAutoLayout
//
//  Created by 卢会旭 on 2018/3/27.
//  Copyright © 2018年 卢会旭. All rights reserved.
//

#import "AutoLayoutTableViewCell.h"

@implementation AutoLayoutTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UILabel *)userLabel {
    if (_userLabel == nil) {
        _userLabel = [[UILabel alloc] init];
        _userLabel.font = [UIFont systemFontOfSize:16];
        _userLabel.textColor = [UIColor redColor];
    }
    return _userLabel;
}
-(UILabel *)content {
    if (_content == nil) {
        _content = [[UILabel alloc] init];
        _content.numberOfLines = 0;
        _content.font = [UIFont systemFontOfSize:14];
    }
    return _content;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
- (void)createUI {
    
    [self addSubview:self.userLabel];
    [self addSubview:self.content];
    //添加约束
    [self.userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(8);
        make.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.height.offset(20);
    }];
    //添加约束
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userLabel.mas_bottom);
        make.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(self);
    }];
    
}
-(void)setModel:(CellModel *)model {
    _model = model;
    self.userLabel.text = model.user;
    self.content.text = model.content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
