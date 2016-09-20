//
//  BaseNetConfig.m
//  EstateBiz
//
//  Created by Ender on 10/26/15.
//  Copyright © 2015 Magicsoft. All rights reserved.
//

#import "BaseNetConfig.h"
#import <YTKNetworkConfig.h>
#import <YTKNetworkAgent.h>
#import "BaseUrlFilter.h"

#define BASE_URL_1 @"http://wetown.kakatool.cn/api/" //正式服务器
#define BASE_URL_2 @"http://192.168.0.169:8000/api/"         //内部测试
#define BASE_URL_3 @"http://wttest.kakatool.com:8080/api/"    //外部测试
#define BASE_URL_4 @"http://121.40.207.233:8080/api/"  //支付测试





/**
 *教程：https://github.com/yuantiku/YTKNetwork/blob/master/BasicGuide.md
 *https://github.com/yuantiku/YTKNetwork/blob/master/ProGuide.md
 *
 */
 

@implementation BaseNetConfig

+(BaseNetConfig *)shareInstance
{
    
    static id baseNetConfig = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
       
        baseNetConfig = [[self alloc] init];
        
    });
    return baseNetConfig;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//配置WeTown服务器
-(void)configGlobalAPI:(YTkServer)server
{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
        switch (server) {
        case WETOWN:{
            config.baseUrl=BASE_URL_1;
            BaseUrlFilter *filter = [BaseUrlFilter filterWithArguments:nil];
            [config addUrlFilter:filter];
        }
            break;
        case KAKATOOL:{
            config.baseUrl= @"https://api.kakatool.com/";
            BaseUrlFilter *filter = [BaseUrlFilter filterKKTWithArguments:nil];
            [config addUrlFilter:filter];
        }
            break;
        case SIMULATOR:{
            config.baseUrl= @"http://rap.taobao.org/mockjs/7227/";
            BaseUrlFilter *filter = [BaseUrlFilter filterSimulatorWithArguments:nil];
            [config addUrlFilter:filter];
        }
            break;
        default:
            break;
    }
    config.cdnUrl=@"";
    
    //服务端返回格式问题，后端返回的结果不是"application/json"，afn 的 jsonResponseSerializer 是不认的。这里做临时处理
    YTKNetworkAgent *agent = [YTKNetworkAgent sharedInstance];
    [agent setValue:[NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json",@"text/html", nil]
         forKeyPath:@"_manager.responseSerializer.acceptableContentTypes"];
    
}
@end
