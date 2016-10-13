//
//  CommandLineParser.m
//  base62
//
//  Created by n on 16/10/13.
//  Copyright © 2016年 summerwu. All rights reserved.
//

#import "CommandLineParser.h"

@interface CommandLineParser ()
@property (nonatomic,strong) NSMutableArray *argv;
@end

@implementation CommandLineParser
- (instancetype)initWithArgc:(int)argc argv:(char **) argv
{
    self = [super init];
    if (self) {

        //创建argv数组
        self.argv = [NSMutableArray array];
        for (int i=0; i<argc; i++) {
            char *cstr = argv[i];
            NSString *ocstr = [NSString stringWithCString:cstr encoding:NSUTF8StringEncoding];
            [self.argv addObject:ocstr];
        }

    }
    return self;
}

- (CommandLineAction)action{
    //首先argv.count要为3，否则就是help
    if (self.argv.count != 3) {
        return CommandLineActionHelp;
    }

    BOOL contains_d = [self.argv containsObject:@"-d"];
    if (contains_d) {
        return CommandLineActionDecode;
    }

    BOOL contains_e = [self.argv containsObject:@"-e"];
    if (contains_e) {
        return CommandLineActionEncode;
    }

    return CommandLineActionHelp;
}

- (NSString *)value{
    return self.argv.lastObject;
}
@end
