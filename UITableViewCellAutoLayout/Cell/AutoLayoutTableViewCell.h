//
//  AutoLayoutTableViewCell.h
//  UITableViewCellAutoLayout
//
//  Created by 卢会旭 on 2018/3/27.
//  Copyright © 2018年 卢会旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
#import "Masonry.h"
@interface AutoLayoutTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *userLabel;//显示用户名
@property(nonatomic,strong)UILabel *content;//显示内容

@property(nonatomic,copy)CellModel *model;
@end
