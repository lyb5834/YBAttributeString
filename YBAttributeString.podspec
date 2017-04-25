Pod::Spec.new do |s|
  s.name         = "YBAttributeString"
  s.version      = "1.0.0"
  s.summary      = "用Masonry的语法写NSAttributedString"
  s.description  = "用Masonry的语法写NSAttributedString/a fast way to create attributedString like Masonry"
  s.homepage     = "https://github.com/lyb5834/YBAttributeString.git"
  s.license      = "MIT"
  s.author       = { "lyb" => "lyb5834@126.com" }
  s.source       = { :git => "https://github.com/lyb5834/YBAttributeString.git", :tag => s.version.to_s }
  s.source_files  = "YBAttributeString/*.{h,m}"
  s.requires_arc = true
  s.platform     = :ios, '7.0'
end
