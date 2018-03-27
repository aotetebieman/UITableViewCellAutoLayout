//
//  CellModel.h
//  UITableViewCellAutoLayout
//
//  Created by 卢会旭 on 2018/3/27.
//  Copyright © 2018年 卢会旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property(nonatomic,copy)NSString *user;//用户

@property(nonatomic,copy)NSString *content;//内容

@property(nonatomic,strong)NSNumber *height;//保存对应model的cell的高度
@end
