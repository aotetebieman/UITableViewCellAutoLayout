//
//  AutolayoutTableViewCellXib.h
//  UITableViewCellAutoLayout
//
//  Created by 卢会旭 on 2018/3/27.
//  Copyright © 2018年 卢会旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface AutolayoutTableViewCellXib : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *user;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property(nonatomic,copy)CellModel *model;
@end
