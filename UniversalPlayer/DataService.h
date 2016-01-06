//
//  DataService.h
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义一个Block类型
typedef void(^FinishBlock)(id result,NSError *error);
@interface DataService : NSObject
/*
 通过你给的文件名字进行数据的读取和解析
 */
+ (id)getResultDataWithFileName:(NSString *)fileName;

/*
 如果请求网络上面的方法封装就不是很完善，因为上面的方法在网络请求中，数据有相当大的延迟时间，程序不会一直等待数据请求完成在往下执行，如果一直等待这一条数据请求，那么这个程序就出现卡的状态
 */
+ (void)getResultDataWithFileName:(NSString *)fileName FinishBlock:(FinishBlock)finishBlock;

@end
