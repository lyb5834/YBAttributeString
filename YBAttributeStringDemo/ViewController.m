//
//  ViewController.m
//  YBAttributeStringDemo
//
//  Created by lyb on 17/4/24.
//  Copyright © 2017年 lyb. All rights reserved.
//

#import "ViewController.h"
#import "YBAttributeString.h"

@interface ViewController ()
<
UITextViewDelegate
>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置
    self.textView.attributedText = [self.textView.text yb_makeAttributes:^(YBAttributeMake *make) {
        
        //设置属性后必须于yb_range(<#integer#>,<#integer#>)或yb_all()结尾
        make.yb_font([UIFont systemFontOfSize:20]).yb_all();
        make.yb_foreColor([UIColor darkGrayColor]).yb_all();
        //这种快捷写法也是可以的
        make.yb_foreColor([UIColor redColor]).yb_range(10, 50).yb_range(250, 50);
        make.yb_backColor([UIColor groupTableViewBackgroundColor]).yb_range(10, 100);
        make.yb_ligature().yb_all();
        make.yb_kern(10).yb_range(100, 10);
        make.yb_strikethrough(NSUnderlineStyleSingle).yb_range(300, 30);
        make.yb_underLine(NSUnderlineStyleSingle).yb_range(120, 50);
        make.yb_underLineColor([UIColor blueColor]).yb_range(120, 20);
        make.yb_strokeWidth(13).yb_range(300, 33);
        make.yb_strokeColor([UIColor blueColor]).yb_range(300, 33);
        make.yb_obliqueness(M_PI_2 / 2).yb_range(200, 100);
        make.yb_link([NSURL URLWithString:@"https://www.baidu.com"]).yb_range(0, 5);
    }];
    
    //更新       只是演示，这些属性不一定要在这个方法里实现
    self.textView.attributedText = [self.textView.attributedText yb_updateAttributes:^(YBAttributeMake *make) {
        
        //一键设置 NSParagraphStyleAttributeName 必须于yb_all()结尾
        //在设置 ParagraphStyle的时候可以这样简写
        make.yb_lineSpace(13).yb_paragraphSpace(20).yb_all();
        make.yb_alignment(NSTextAlignmentCenter).yb_firstIndent(20).yb_all();
        make.yb_lineBreakMode(NSLineBreakByCharWrapping).yb_all();
        
        //一键设置 NSShadowAttributeName 
        //在设置 Shadow的时候可以这样简写
        make.yb_shadowOffset(4, 4).yb_shadowRadius(5).yb_shadowColor([UIColor brownColor]).yb_range(5, 100);
        
        //一键设置 NSAttachmentAttributeName 必须于yb_location(<#integer#>)结尾
        make.yb_image([UIImage imageNamed:@"flower"]).yb_size(30, 30).yb_location(300).yb_location(220).yb_location(350);
    }];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(nonnull NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
{
    NSLog(@"点击了link URL：%@",URL);
    return YES;
}



@end
