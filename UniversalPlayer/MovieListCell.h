//
//  MovieListCell.h
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface MovieListCell : UITableViewCell
{
    UIImageView *_titleImageView;   // 标题图片
    UILabel *_titleLabel;           // 标题文本
    UILabel *_scoreLabel;           // 评分文本
    UILabel *_yearLabel;            // 年份
}

@property (nonatomic, strong) MovieModel *model;
@end
