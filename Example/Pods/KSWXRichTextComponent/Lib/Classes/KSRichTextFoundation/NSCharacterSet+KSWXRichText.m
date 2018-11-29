//
//  NSCharacterSet+KSWXRichText.m
//  kaiStart
//
//  Created by HJaycee on 2018/11/2.
//  Copyright © 2018 KaiShiZhongChou. All rights reserved.
//

#import "NSCharacterSet+KSWXRichText.h"

static NSCharacterSet *_quoteCharacterSet = nil;
static NSCharacterSet *_cssStyleAttributeNameCharacterSet = nil;

@implementation NSCharacterSet (KSWXRichText)

+ (NSCharacterSet *)quoteCharacterSet
{
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _quoteCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"'\""];
    });
    
    return _quoteCharacterSet;
}

// NOTE: cannot contain : because otherwise this messes up parsing of CSS style attributes
+ (NSCharacterSet *)cssStyleAttributeNameCharacterSet
{
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _cssStyleAttributeNameCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"-_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"];
    });
    return _cssStyleAttributeNameCharacterSet;
}

@end
