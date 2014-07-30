//
//  Constants.h
//  pupudemo1
//
//  Created by Paul Yip on 29/7/14.
//  Copyright (c) 2014 safecapital. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define EN @"en"
#define ZH_Hant @"zh-Hant"
#define ZH_Hans @"zh-Hans"
#define USER_LANG @"pupu_user_lang"

@interface Constants : NSObject

+ (NSString *)MyLocalizedString:(NSString *)_key defaultIfEmpty:(NSString *)_defaultIfEmpty;
+ (NSString *)MyLocalizedStringWithLang:(NSString *)_key lang:(NSString *)_lang defaultIfEmpty:(NSString *)_defaultIfEmpty;

@end
