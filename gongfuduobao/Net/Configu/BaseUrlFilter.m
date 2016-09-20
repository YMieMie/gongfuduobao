//
//  BaseUrlFilter.m
//  EstateBiz
//
//  Created by Ender on 10/26/15.
//  Copyright © 2015 Magicsoft. All rights reserved.
//

#import "BaseUrlFilter.h"
#import "UIDevice+MacAddress.h"
#import "UIDevice+Hardware.h"
#import "NSString+helper.h"

@implementation BaseUrlFilter{
    
    NSDictionary *_arguments;
}

//配置WeTown服务器参数
+ (BaseUrlFilter *)filterWithArguments:(NSDictionary *)arguments {
    
    if (arguments==nil) {

        NSString *device = [[UIDevice currentDevice] uniqueDeviceIdentifier];
//        NSString *ver = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
        NSString *ver1 = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        //        NSArray *arr = [ver1 componentsSeparatedByString:@"."];
        //        NSString *ver = [arr componentsJoinedByString:@""];
        NSString *ver = [ver1 stringByReplacingOccurrencesOfString:@"." withString:@""];
        NSString *model = [[[UIDevice currentDevice] platformString] trim];
        NSString *sdkver = [[UIDevice currentDevice] systemVersion];
        NSString *ct=@"c";
        
        //设置token
        NSString *kkToken = [LocalData getAccessToken];
        UserModel *user = [[LocalData shareInstance] getUserAccount];
        NSString *cid = @"";
        if (user) {
            cid=user.cid;
        }
    
        NSDate *date = [NSDate date];
        NSString *timeStamp = [NSString stringWithFormat:@"%.f",[date timeIntervalSince1970]];
        
        
        NSString *token = @"";
        token = [[NSString stringWithFormat:@"%@%@%@",cid,kkToken,timeStamp] MD5Hash];
        
        return [[self alloc]initWithArguments:@{@"device":device,@"ver":ver,@"model":model,@"platform":APP_PLATFORM,@"sdkver":sdkver,@"token":token,@"ct":ct,@"cid":cid,@"timestamp":timeStamp,@"appid":APP_ID}];

        
    }
    else{
         return [[self alloc] initWithArguments:arguments];
    }
   
}

//配置卡卡兔参数
+ (BaseUrlFilter *)filterKKTWithArguments:(NSDictionary *)arguments{
    
    if (arguments==nil) {
        
        NSString *device = [[UIDevice currentDevice] uniqueDeviceIdentifier];
//        NSString *ver = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
        NSString *ver1 = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        //        NSArray *arr = [ver1 componentsSeparatedByString:@"."];
        //        NSString *ver = [arr componentsJoinedByString:@""];
        NSString *ver = [ver1 stringByReplacingOccurrencesOfString:@"." withString:@""];
        NSString *model = [[[UIDevice currentDevice] platformString] trim];
        NSString *sdkver = [[UIDevice currentDevice] systemVersion];
        NSString *ct=@"c";
        
        //设置token
        NSString *kkToken = [LocalData getAccessToken];
       
        return [[self alloc]initWithArguments:@{@"device":device,@"ver":ver,@"model":model,@"platform":APP_PLATFORM,@"sdkver":sdkver,@"token":kkToken,@"ct":ct,@"appid":APP_ID}];
        
        
    }
    else{
        return [[self alloc] initWithArguments:arguments];
    }
}
//配置WeTown服务器参数
+ (BaseUrlFilter *)filterSimulatorWithArguments:(NSDictionary *)arguments {
    
    if (arguments==nil) {
        
//        NSString *device = [[UIDevice currentDevice] uniqueDeviceIdentifier];
//        //        NSString *ver = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
//        NSString *ver1 = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
//        //        NSArray *arr = [ver1 componentsSeparatedByString:@"."];
//        //        NSString *ver = [arr componentsJoinedByString:@""];
//        NSString *ver = [ver1 stringByReplacingOccurrencesOfString:@"." withString:@""];
//        NSString *model = [[[UIDevice currentDevice] platformString] trim];
//        NSString *sdkver = [[UIDevice currentDevice] systemVersion];
//        NSString *ct=@"c";
//        
//        //设置token
//        NSString *kkToken = [LocalData getAccessToken];
        UserModel *user = [[LocalData shareInstance] getUserAccount];
        NSString *cid = @"";
        if (user) {
            cid=user.cid;
        }
        
//        NSDate *date = [NSDate date];
//        NSString *timeStamp = [NSString stringWithFormat:@"%.f",[date timeIntervalSince1970]];
//        
//        
//        NSString *token = @"";
//        token = [[NSString stringWithFormat:@"%@%@%@",cid,kkToken,timeStamp] MD5Hash];
        
//        return [[self alloc]initWithArguments:@{@"device":device,@"ver":ver,@"model":model,@"platform":APP_PLATFORM,@"sdkver":sdkver,@"token":token,@"ct":ct,@"cid":cid,@"timestamp":timeStamp,@"appid":APP_ID}];
        
        return [[self alloc]initWithArguments:@{@"cid":cid}];
        
        
    }
    else{
        return [[self alloc] initWithArguments:arguments];
    }
    
}
- (id)initWithArguments:(NSDictionary *)arguments {
    self = [super init];
    if (self) {
        _arguments = arguments;
    }
    return self;
}

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {

    NSLog(@"_arguments:%@",request.requestArgument);
    return [YTKNetworkPrivate urlStringWithOriginUrlString:originUrl appendParameters:_arguments];
}


@end
