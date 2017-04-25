# YBAttributeString
像Masonry一样快速创建AttributedString/a fast way to create attributedString like Masonry

#  效果图
 ![(演示效果)](http://7xt3dd.com1.z0.glb.clouddn.com/YBAttributeStringAnimation.gif)

# 简介
众所周知，Masonry是一个非常优秀的AutoLayout三方库，它最方便的地方在于巧妙的用了优雅且简洁的链式语法，本框架也使用了类似Masonry的链式语法，让设置attributedString方便优雅起来。

# 优势
 *  拒绝大量繁琐的系统API
 *  一键设置 `NSParagraphStyleAttributeName`、`NSShadowAttributeName`、`NSAttachmentAttributeName`
 *  不侵入，不破坏原本API

 # PS
* xcode 8.3 以后，block的get方法也会自动补全了哦，使用本框架更方便了

 # 用法
* 首先 
`[text yb_makeAttributes:^(YBAttributeMake *make) {        }];`
* 普通用法
`make.yb_font([UIFont systemFontOfSize:20]).yb_range(10, 50);`
* 快捷用法
`make.yb_font([UIFont systemFontOfSize:20]).yb_range(10, 50).yb_range(60, 50);`

 # 注意
* 设置`NSParagraphStyleAttributeName`相关属性的时候，结尾必须是`yb_all()`,不然无效
* 设置相关属性的时候，结尾必须是`yb_location(integer)`,不然无效

# 版本支持
* `xcode7.0+`

* 如果您在使用本库的过程中发现任何bug或者有更好建议，欢迎联系本人email  lyb5834@126.com
