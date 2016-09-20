//
//  BaseUrlFilter.h
//  EstateBiz
//
//  Created by Ender on 10/26/15.
//  Copyright © 2015 Magicsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YTKNetworkConfig.h>
#import <YTKNetworkPrivate.h>

@interface BaseUrlFilter : NSObject<YTKUrlFilterProtocol>

//配置WeTown服务器参数
+ (BaseUrlFilter *)filterWithArguments:(NSDictionary *)arguments;

//配置卡卡兔服务器参数
+ (BaseUrlFilter *)filterKKTWithArguments:(NSDictionary *)arguments;

+ (BaseUrlFilter *)filterSimulatorWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;

@end
