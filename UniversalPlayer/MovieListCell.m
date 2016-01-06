//
//  MovieListCell.m
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "MovieListCell.h"

@implementation MovieListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        //初始化子视图
        [self _initSubViews];
    }
    return self;
}
//初始化子视图
- (void)_initSubViews{

    // 1.创建标题图片
    _titleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_titleImageView];
    
    // 2.创建标题文本视图
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.font = [UIFont boldSystemFontOfSize:22];
    _titleLabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:_titleLabel];
    
    // 3.创建评分文本视图
    _scoreLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _scoreLabel.textColor = [UIColor whiteColor];
    _scoreLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_scoreLabel];
    
    // 4.创建年份文本视图
    _yearLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _yearLabel.textColor = [UIColor whiteColor];
    _yearLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_yearLabel];
}
- (void)layoutSubviews{

    [super layoutSubviews];
    // 1.设置图片大小和内容
    // 设置frame
    _titleImageView.frame = CGRectMake(10, 10, 60, 90);
    /*
     注意：因为没有使用多线程，现在是没有办法解决这个由于网络问题出现的卡顿或卡死的问题
     // 获取图片的地址，转换成路径对象
     NSURL *imageUrl = [NSURL URLWithString:self.model.images_medium];
     // 通过url路径获取这个路径下的数据
     NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageUrl];
     // 把数据转换成图片对象显示
     _titleImageView.image = [UIImage imageWithData:imageData];
     */
    
    // 获取图片的地址，转换成路径对象
    NSURL *imageUrl = [NSURL URLWithString:self.model.images_medium];
    // 通过使用SDWebImage的第三方类库，加载网络图片防止引用程序出现卡顿的效果
    [_titleImageView sd_setImageWithURL:imageUrl];
    
    
    // 2.设置标题文本
    _titleLabel.frame = CGRectMake(_titleImageView.right + 10, 10, 150, 25);
    _titleLabel.text = self.model.title;
    
    // 3.设置评分
    _scoreLabel.frame = CGRectMake(_titleLabel.left, _titleLabel.bottom + 10, 150, 15);
    _scoreLabel.text = [NSString stringWithFormat:@"%@",self.model.average];
    
    // 4.设置年份
    _yearLabel.frame = CGRectMake(_titleLabel.left, _scoreLabel.bottom + 10, 150, 15);
    _yearLabel.text = [NSString stringWithFormat:@"年份：%@",self.model.year];
    
}
@end
