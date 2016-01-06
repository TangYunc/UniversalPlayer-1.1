//
//  DataService.m
//  UniversalPlayer
//
//  Created by Mr_Tang on 16/1/6.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "DataService.h"

@implementation DataService
/*
 通过你给的文件名字进行数据的读取和解析
 */
+ (id)getResultDataWithFileName:(NSString *)fileName{

    //1.从本地文件中读取数据
    //获取文件本地的路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    //把本地数据读取出来，不需要任何转换，就是二进制数据
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    //2.json数据解析
    //定义一个错误的信息对象
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error ==nil) {
        //解析数据成功
        return result;
    }else{
    //解析数据失败
        NSLog(@"Bug:%@",error);
        return nil;
    }
}


/*
 如果请求网络上面的方法封装就不是很完善，因为上面的方法在网络请求中，数据有相当大的延迟时间，程序不会一直等待数据请求完成在往下执行，如果一直等待这一条数据请求，那么这个程序就出现卡的状态
 */
+ (void)getResultDataWithFileName:(NSString *)fileName FinishBlock:(FinishBlock)finishBlock{

    //1.本地文件中读取数据
    //获取文件本地的路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    //把本地数据读取出来，不需要任何转换，就是二进制数据
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    //2.json数据解析
    //定义一个错误的信息对象
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error == nil) {
        //解析成功
        finishBlock(result,nil);
    }else{
    //如果解析失败
        finishBlock(nil,error);
    }
}
@end
