#
#  Be sure to run `pod spec lint HXUI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "HXUI"
  spec.version      = "0.0.1"
  spec.summary      = "怀轩自己的常用开发库."
  spec.description  = <<-DESC
                    日常开发中用到的一些UI控件或者页面
                   DESC

  spec.homepage     = "https://github.com/liuhuaixuan/HXUI"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "刘怀轩" => "17612178049@163.com" }
  # spec.social_media_url   = "https://twitter.com/刘怀轩"
  spec.platform     = :ios, "9.0"
  
  spec.source       = { :git => "https://github.com/liuhuaixuan/HXUI.git", :tag => "#{spec.version}" }
  spec.source_files = "HXUI/**/*.{h,m}"
  spec.requires_arc = true
  spec.dependency "QMUIKit", "~> 4.1.3"

end
