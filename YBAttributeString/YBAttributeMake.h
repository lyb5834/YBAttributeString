//
//  YBAttributeMake.h
//  YBAttributeText
//
//  Created by lyb on 17/4/24.
//  Copyright © 2017年 lyb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define YB_SAFE_BLOCK(BlockName, ...) ({ !BlockName ? nil : BlockName(__VA_ARGS__); })
@interface YBAttributeMake : NSObject

typedef YBAttributeMake * (^YBAttributeNull)();
typedef YBAttributeMake * (^YBAttributeItem)(id);
typedef YBAttributeMake * (^YBAttributeAssign)(CGFloat);
typedef YBAttributeMake * (^YBAttributeRange)(NSInteger,NSInteger);
typedef YBAttributeMake * (^YBAttributeSize)(CGFloat,CGFloat);

/**
 NSRange
 */
@property (nonatomic, copy, readonly) YBAttributeRange   yb_range;

/**
 MAXRange
 */
@property (nonatomic, copy, readonly) YBAttributeNull    yb_all;

#pragma mark - AttributeNames
//注意：属性的时候必须用yb_range(<#integer#>,<#integer#>)或yb_all()结尾，不然无效

/**
 移除一个attribute属性
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_remove;

/**
 NSFontAttributeName 字体属性
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_font;

/**
 NSForegroundColorAttributeName 字体颜色
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_foreColor;

/**
 NSBackgroundColorAttributeName 字体所在区域的背景色
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_backColor;

/**
 NSLigatureAttributeName 设置连体（中文无效）
 */
@property (nonatomic, copy, readonly) YBAttributeNull    yb_ligature;

/**
 NSKernAttributeName 字符间距(整数），正值间距加宽，负值间距变窄
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_kern;

/**
 NSStrikethroughStyleAttributeName 设置删除线， NSUnderlineStyle
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_strikethrough;

/**
 NSStrikethroughColorAttributeName 设置删除线颜色(默认是黑色) 单独设置无效果
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_strikethroughColor;

/**
 NSBaselineOffsetAttributeName 设置基线偏移值，(float）,正值上偏，负值下偏
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_baselineOffset;

/**
 NSUnderlineStyleAttributeName 设置下划线，NSUnderlineStyle
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_underLine;

/**
 NSUnderlineColorAttributeName 下划线颜色(默认是黑色) 单独设置无效果！
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_underLineColor;

/**
 NSStrokeWidthAttributeName 设置笔画宽度，（整数），负值填充效果，正值中空效果
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_strokeWidth;

/**
 NSStrokeColorAttributeName  填充部分颜色，不是字体颜色
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_strokeColor;

/**
 NSObliquenessAttributeName  设置字形倾斜度，（float）,正值右倾，负值左倾
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_obliqueness;

/**
 NSExpansionAttributeName 设置文本横向拉伸属性，（float）,正值横向拉伸文本，负值横向压缩文本
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_expansion;

/**
 NSWritingDirectionAttributeName 设置文字书写方向，NSWritingDirection
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_direction;

/**
 NSVerticalGlyphFormAttributeName 设置文字排版方向，(整数)，0 表示横排文本，1 表示竖排文本
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_vertical;

/**
 NSLinkAttributeName 设置链接属性，点击后调用浏览器打开指定URL地址,NSURL or NSString
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_link;

#pragma mark - NSParagraphStyleAttributeName 相关属性
//注意：用NSParagraphStyleAttributeName相关属性的时候只能用.yb_all()结尾，不然无效

/**
 行间距
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_lineSpace;

/**
 段间距
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_paragraphSpace;

/**
 文本对齐方式
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_alignment;

/**
 首行缩进
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_firstIndent;

/**
 整体缩进（首行除外）
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_headIndent;

/**
 整体缩进（尾行除外）
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_tailIndent;

/**
 分行样式 NSLineBreakMode
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_lineBreakMode;

/**
 最低行高
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_minHeight;

/**
 最大行高
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_maxHeight;

/**
 段首行空白
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_before;

#pragma mark - NSShadowAttributeName 相关属性
//注意：用NSShadowAttributeName相关属性的时候必须用yb_range(<#integer#>,<#integer#>)或yb_all()结尾,不然无效

/**
 阴影offset
 */
@property (nonatomic, copy, readonly) YBAttributeSize    yb_shadowOffset;

/**
 阴影圆角
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_shadowRadius;

/**
 阴影颜色 default is black with an alpha value of 1/3
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_shadowColor;

#pragma mark - NSAttachmentAttributeName 相关属性
//注意：用NSAttachmentAttributeName相关属性的时候只能用.yb_location(<#integer#>)结尾，不然无效

/**
 contents
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_contents;

/**
 fileType
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_filetype;

/**
 image
 */
@property (nonatomic, copy, readonly) YBAttributeItem    yb_image;

/**
 size
 */
@property (nonatomic, copy, readonly) YBAttributeSize    yb_size;

/**
 位置
 */
@property (nonatomic, copy, readonly) YBAttributeAssign  yb_location;


#pragma mark - private functions
@property (nonatomic, strong, readonly) NSMutableAttributedString *attributeStr;
- (instancetype)initWithString:(NSString *)string;
- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString;
@end
