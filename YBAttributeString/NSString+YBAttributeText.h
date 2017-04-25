//
//  NSString+YBAttributeText.h
//  YBAttributeText
//
//  Created by lyb on 17/4/21.
//  Copyright © 2017年 lyb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBAttributeMake.h"

@interface NSString (YBAttributeTextMake)

/**
 设置attributedString
 */
- (NSAttributedString *)yb_makeAttributes:(void (^) (YBAttributeMake * make))block;

@end


