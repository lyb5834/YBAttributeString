//
//  NSString+YBAttributeText.m
//  YBAttributeText
//
//  Created by lyb on 17/4/21.
//  Copyright © 2017年 lyb. All rights reserved.
//

#import "NSString+YBAttributeText.h"

@implementation NSString (YBAttributeTextMake)

- (NSAttributedString *)yb_makeAttributes:(void (^) (YBAttributeMake * make))block
{
    YBAttributeMake *make = [[YBAttributeMake alloc] initWithString:self];
    YB_SAFE_BLOCK(block, make);
    return make.attributeStr;
}

@end




