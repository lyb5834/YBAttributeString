//
//  NSAttributedString+YBAttributeText.m
//  YBAttributeText
//
//  Created by lyb on 17/4/24.
//  Copyright © 2017年 lyb. All rights reserved.
//

#import "NSAttributedString+YBAttributeText.h"

@implementation NSAttributedString (YBAttributeText)

- (NSAttributedString *)yb_updateAttributes:(void (^)(YBAttributeMake *))block
{
    YBAttributeMake *make = [[YBAttributeMake alloc] initWithAttributedString:self];
    YB_SAFE_BLOCK(block, make);
    return make.attributeStr;
}

@end
