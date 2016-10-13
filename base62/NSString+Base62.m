//
//  NSString+Base62.m
//  FORK
//
//  Created by Pepsin on 4/25/15.
//  Copyright (c) 2015 com.blink. All rights reserved.
//

#import "NSString+Base62.h"

@implementation NSString (Base62)

- (NSNumber *) decode62
{
    int num = 0;
    static NSString * alphabet = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0, len = (int)[self length]; i < len; i++)
    {
        NSRange range = [alphabet rangeOfString:[self substringWithRange:NSMakeRange(i,1)]];
        num = num * 62 + (int)range.location;
    }
    
    return [NSNumber numberWithInt:num];
}

+ (NSString *)encode:(NSUInteger)num
{
    static const char *alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    NSUInteger base = 62;
    
    char result[20]; // sufficient room to encode 2^64 in Base-62
    char *p = result + sizeof(result);
    
    *--p = 0; // NULL termination
    while (num > 0) {
        *--p = alphabet[num % base];
        num /= base;
    }
    return [NSString stringWithUTF8String:p];
}

@end
