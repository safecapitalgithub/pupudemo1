//
//  Constants.m
//  pupudemo1
//
//  Created by Paul Yip on 29/7/14.
//  Copyright (c) 2014 safecapital. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+ (NSString *)MyLocalizedString:(NSString *)_key defaultIfEmpty:(NSString *)_defaultIfEmpty
{
    NSString *userLang = [[NSUserDefaults standardUserDefaults] objectForKey:USER_LANG];
    if (![userLang isEqualToString:ZH_Hant]) {
        userLang = ZH_Hans;
    }
    
    return [self MyLocalizedStringWithLang:_key lang:userLang defaultIfEmpty:_defaultIfEmpty];
}

+ (NSString *)MyLocalizedStringWithLang:(NSString *)_key lang:(NSString *)_lang defaultIfEmpty:(NSString *)_defaultIfEmpty
{
    NSString *result = nil;
    if (_key && _lang) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"strings" inDirectory:nil forLocalization:_lang];
        
        // compiled .strings file becomes a "binary property list"
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        
        result = [dict objectForKey:_key];
        if (!result) {
            result = _defaultIfEmpty;
        }
        
        dict = nil;
        path = nil;
    } else {
        result = _defaultIfEmpty;
    }
    return result;
}

@end
