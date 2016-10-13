//
//  NSString+Base62.h
//  FORK
//
//  Created by Pepsin on 4/25/15.
//  Copyright (c) 2015 com.blink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base62)

- (NSNumber *)decode62;
+ (NSString *)encode:(NSUInteger)num;
@end
