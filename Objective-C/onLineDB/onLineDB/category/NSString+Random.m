//
//  NSString+Random.m
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 05/11/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//
#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end