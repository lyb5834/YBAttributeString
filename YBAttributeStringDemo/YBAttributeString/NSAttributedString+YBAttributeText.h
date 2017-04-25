//
//  NSAttributedString+YBAttributeText.h
//  YBAttributeText
//
//  Created by lyb on 17/4/24.
//  Copyright © 2017年 lyb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBAttributeMake.h"

@interface NSAttributedString (YBAttributeText)

/**
 更新attributedString
 */
- (NSAttributedString *)yb_updateAttributes:(void (^) (YBAttributeMake * make))block;

@end
