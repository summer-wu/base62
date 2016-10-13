//
//  main.m
//  base62
//
//  Created by n on 16/10/13.
//  Copyright © 2016年 summerwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Base62.h"
#import "CommandLineParser.h"

void printArgcArgv(int argc, char * argv[]){
    printf("-------enter main method, printArgcArgv:-------\n");
    for (int i=0; i<argc; i++) {
        printf("%d: %s\n",i,argv[i]);
    }
    printf("-------printArgcArgv end---------\n");
}

void printDecodeResult(NSString * value){
    NSNumber *num = [value decode62];
    printf("decode62: %s -> %s\n",[value UTF8String],[num.stringValue UTF8String]);
}

///value是整数
void printEncodeResult(NSString * value){
    NSString *str = [NSString encode:value.integerValue];
    printf("encode62: %s -> %s\n",[value UTF8String],[str UTF8String]);
}

void printHelp(){
    printf("Help:\n"
           "base62 -d 1z #decode base62 string 1z to integer 123 \n"
           "base62 -e 123 #encode integer 123 to base62 string 1z \n"
           "base62 #print help\n");
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //printArgcArgv(argc, argv);
        CommandLineParser *parser = [[CommandLineParser alloc]initWithArgc:argc argv:argv];
        switch (parser.action) {
            case CommandLineActionDecode:
                printDecodeResult(parser.value);
                break;
            case CommandLineActionEncode:
                printEncodeResult(parser.value);
                break;
            case CommandLineActionHelp:
                printHelp();
                break;
        }
    }
    return 0;
}
