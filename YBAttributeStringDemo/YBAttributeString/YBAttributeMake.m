//
//  YBAttributeMake.m
//  YBAttributeText
//
//  Created by lyb on 17/4/24.
//  Copyright © 2017年 lyb. All rights reserved.
//

#import "YBAttributeMake.h"

#define YBWeak(value) autoreleasepool{} __weak typeof(value) weak##value = value;
#define YBStrong(value) autoreleasepool{} __strong typeof(value) value = weak##value;

static NSString * const YB_REMOVE_KEY = @"com.yb.remove.key";
@interface YBAttributeMake ()
@property (nonatomic) NSRange range;
@property (nonatomic, copy) NSString *attributeKey;
@property (nonatomic, strong) id attributeItem;
@property (nonatomic, strong) NSMutableParagraphStyle *style;
@property (nonatomic, strong) NSShadow *shadow;
@property (nonatomic, strong) NSTextAttachment *textAttachment;
@end

@implementation YBAttributeMake

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        _attributeStr = [[NSMutableAttributedString alloc] initWithString:string];
    }
    return self;
}

- (instancetype)initWithAttributedString:(NSAttributedString *)attributedString
{
    self = [super init];
    if (self) {
        _attributeStr = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    }
    return self;
}

#pragma mark - lazyLoads
- (NSMutableParagraphStyle *)style
{
    if (!_style) {
        _style = [[NSMutableParagraphStyle alloc] init];
    }
    self.attributeKey = NSParagraphStyleAttributeName;
    self.attributeItem = _style;
    return _style;
}

- (NSShadow *)shadow
{
    if (!_shadow) {
        _shadow = [[NSShadow alloc] init];
    }
    self.attributeKey = NSShadowAttributeName;
    self.attributeItem = _shadow;
    return _shadow;
}

- (NSTextAttachment *)textAttachment
{
    if (!_textAttachment) {
        _textAttachment = [[NSTextAttachment alloc] init];
    }
    self.attributeKey = NSAttachmentAttributeName;
    self.attributeItem = _textAttachment;
    return _textAttachment;
}

#pragma mark - functions
- (YBAttributeRange)yb_range
{
    @YBWeak(self);
    return ^ (NSInteger location, NSInteger length) {
        @YBStrong(self);
        self.range = NSMakeRange(location, length);
        return self;
    };
}

- (void)setRange:(NSRange)range
{
    _range = range;
    if (self.attributeKey.length == 0 || self.attributeItem == nil) return;
    if ((range.location + range.length) > self.attributeStr.length) {
        NSAssert(NO, @"NSRange(%ld,%ld) is out of bounds",range.location,range.length);
    }
    if ([self.attributeKey isEqualToString:YB_REMOVE_KEY]) {
        [self.attributeStr removeAttribute:self.attributeItem range:range];
    }else {
        [self.attributeStr addAttribute:self.attributeKey value:self.attributeItem range:range];
    }
}

- (YBAttributeNull)yb_all
{
    @YBWeak(self);
    return ^ {
        @YBStrong(self);
        [self setRange:NSMakeRange(0, self.attributeStr.length)];
        return self;
    };
}

- (YBAttributeItem)yb_remove
{
    @YBWeak(self);
    return ^ (NSString * item) {
        @YBStrong(self);
        self.attributeKey = YB_REMOVE_KEY;
        self.attributeItem = item;
        return self;
    };
}

- (YBAttributeItem)yb_font
{
    @YBWeak(self);
    return ^ (id font) {
        @YBStrong(self);
        self.attributeKey = NSFontAttributeName;
        self.attributeItem = font;
        return self;
    };
}

- (YBAttributeItem)yb_foreColor
{
    @YBWeak(self);
    return ^ (id color) {
        @YBStrong(self);
        self.attributeKey = NSForegroundColorAttributeName;
        self.attributeItem = color;
        return self;
    };
}

- (YBAttributeItem)yb_backColor
{
    @YBWeak(self);
    return ^ (id color) {
        @YBStrong(self);
        self.attributeKey = NSBackgroundColorAttributeName;
        self.attributeItem = color;
        return self;
    };
}

- (YBAttributeNull)yb_ligature
{
    @YBWeak(self);
    return ^ {
        @YBStrong(self);
        self.attributeKey = NSLigatureAttributeName;
        self.attributeItem = @(1);
        return self;
    };
}

- (YBAttributeAssign)yb_kern
{
    @YBWeak(self);
    return ^ (CGFloat kern) {
        @YBStrong(self);
        self.attributeKey = NSKernAttributeName;
        self.attributeItem = [NSNumber numberWithInteger:kern];
        return self;
    };
}

- (YBAttributeAssign)yb_strikethrough
{
    @YBWeak(self);
    return ^ (CGFloat strikethrough) {
        @YBStrong(self);
        self.attributeKey = NSStrikethroughStyleAttributeName;
        self.attributeItem = [NSNumber numberWithInteger:strikethrough];
        return self;
    };
}

- (YBAttributeItem)yb_strikethroughColor
{
    @YBWeak(self);
    return ^ (UIColor * strikeColor) {
        @YBStrong(self);
        self.attributeKey = NSStrikethroughColorAttributeName;
        self.attributeItem = strikeColor;
        return self;
    };
}

- (YBAttributeAssign)yb_baselineOffset
{
    @YBWeak(self);
    return ^ (CGFloat baselineOffset) {
        @YBStrong(self);
        self.attributeKey = NSBaselineOffsetAttributeName;
        self.attributeItem = [NSNumber numberWithDouble:baselineOffset];
        return self;
    };
}

- (YBAttributeAssign)yb_underLine
{
    @YBWeak(self);
    return ^ (CGFloat underLine) {
        @YBStrong(self);
        self.attributeKey = NSUnderlineStyleAttributeName;
        self.attributeItem = [NSNumber numberWithInteger:underLine];
        return self;
    };
}

- (YBAttributeItem)yb_underLineColor
{
    @YBWeak(self);
    return ^ (UIColor * underLineColor) {
        @YBStrong(self);
        self.attributeKey = NSUnderlineColorAttributeName;
        self.attributeItem = underLineColor;
        return self;
    };
}

- (YBAttributeAssign)yb_strokeWidth
{
    @YBWeak(self);
    return ^ (CGFloat strokeWidth) {
        @YBStrong(self);
        self.attributeKey = NSStrokeWidthAttributeName;
        self.attributeItem = [NSNumber numberWithInteger:strokeWidth];
        return self;
    };
}

- (YBAttributeItem)yb_strokeColor
{
    @YBWeak(self);
    return ^ (UIColor * strokeColor) {
        @YBStrong(self);
        self.attributeKey = NSStrokeColorAttributeName;
        self.attributeItem = strokeColor;
        return self;
    };
}

- (YBAttributeAssign)yb_obliqueness
{
    @YBWeak(self);
    return ^ (CGFloat obliqueness) {
        @YBStrong(self);
        self.attributeKey = NSObliquenessAttributeName;
        self.attributeItem = [NSNumber numberWithDouble:obliqueness];
        return self;
    };
}

- (YBAttributeAssign)yb_expansion
{
    @YBWeak(self);
    return ^ (CGFloat expansion) {
        @YBStrong(self);
        self.attributeKey = NSExpansionAttributeName;
        self.attributeItem = [NSNumber numberWithDouble:expansion];
        return self;
    };
}

- (YBAttributeItem)yb_direction
{
    @YBWeak(self);
    return ^ (NSArray * direction) {
        @YBStrong(self);
        self.attributeKey = NSWritingDirectionAttributeName;
        self.attributeItem = direction;
        return self;
    };
}

- (YBAttributeAssign)yb_vertical
{
    @YBWeak(self);
    return ^ (CGFloat vertical) {
        @YBStrong(self);
        self.attributeKey = NSVerticalGlyphFormAttributeName;
        self.attributeItem = [NSNumber numberWithInteger:vertical];
        return self;
    };
}

- (YBAttributeItem)yb_link
{
    @YBWeak(self);
    return ^ (NSURL * link) {
        @YBStrong(self);
        self.attributeKey = NSLinkAttributeName;
        self.attributeItem = link;
        return self;
    };
}


#pragma mark - NSParagraphStyleAttributeName 相关属性
- (YBAttributeAssign)yb_lineSpace
{
    @YBWeak(self);
    return ^ (CGFloat lineSpace) {
        @YBStrong(self);
        self.style.lineSpacing = lineSpace;
        return self;
    };
}

- (YBAttributeAssign)yb_alignment
{
    @YBWeak(self);
    return ^ (CGFloat alignment) {
        @YBStrong(self);
        self.style.alignment = alignment;
        return self;
    };
}

- (YBAttributeAssign)yb_paragraphSpace
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.style.paragraphSpacing = value;
        return self;
    };
}

- (YBAttributeAssign)yb_firstIndent
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.style.firstLineHeadIndent = value;
        return self;
    };
}

- (YBAttributeAssign)yb_headIndent
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.style.headIndent = value;
        return self;
    };
}

- (YBAttributeAssign)yb_tailIndent
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.style.tailIndent = value;
        return self;
    };
}

- (YBAttributeAssign)yb_lineBreakMode
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.style.lineBreakMode = value;
        return self;
    };
}

- (YBAttributeAssign)yb_minHeight
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.style.minimumLineHeight = value;
        return self;
    };
}

- (YBAttributeAssign)yb_maxHeight
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.style.maximumLineHeight = value;
        return self;
    };
}

- (YBAttributeAssign)yb_before
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.style.paragraphSpacingBefore = value;
        return self;
    };
}

#pragma mark - NSShadowAttributeName 相关属性
- (YBAttributeSize)yb_shadowOffset
{
    @YBWeak(self);
    return ^ (CGFloat w, CGFloat h) {
        @YBStrong(self);
        self.shadow.shadowOffset = CGSizeMake(w, h);
        return self;
    };
}

- (YBAttributeAssign)yb_shadowRadius
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        self.shadow.shadowBlurRadius = value;
        return self;
    };
}

- (YBAttributeItem)yb_shadowColor
{
    @YBWeak(self);
    return ^ (UIColor * shadowColor) {
        @YBStrong(self);
        self.shadow.shadowColor = shadowColor;
        return self;
    };
}

#pragma mark - NSAttachmentAttributeName 相关属性
- (YBAttributeItem)yb_contents
{
    @YBWeak(self);
    return ^ (id contents) {
        @YBStrong(self);
        self.textAttachment.contents = contents;
        return self;
    };
}

- (YBAttributeItem)yb_filetype
{
    @YBWeak(self);
    return ^ (NSString * filetype) {
        @YBStrong(self);
        self.textAttachment.fileType = filetype;
        return self;
    };
}

- (YBAttributeItem)yb_image
{
    @YBWeak(self);
    return ^ (UIImage * image) {
        @YBStrong(self);
        self.textAttachment.image = image;
        return self;
    };
}

- (YBAttributeSize)yb_size
{
    @YBWeak(self);
    return ^ (CGFloat w, CGFloat h) {
        @YBStrong(self);
        self.textAttachment.bounds = CGRectMake(0, 0, w, h);
        return self;
    };
}

- (YBAttributeAssign)yb_location
{
    @YBWeak(self);
    return ^ (CGFloat value) {
        @YBStrong(self);
        NSAttributedString *attStr = [NSAttributedString attributedStringWithAttachment:self.textAttachment];
        NSAssert(value < self.attributeStr.length, @"location is out of Range");
        [self.attributeStr insertAttributedString:attStr atIndex:value];
        return self;
    };
}

@end
