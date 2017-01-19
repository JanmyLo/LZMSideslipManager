#
#  Be sure to run `pod spec lint LZMSideslipManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "LZMSideslipManager"
  s.version      = "1.0.1"
  s.summary      = "A simply multi-views manager tool based on Objective-C which supports left-right direction slip."
  s.description  = <<-DESC
    一款轻量的多页面管理框架工具，类似QQ的侧滑效果，支持左右侧滑，点击/拖动手势都能操作。A simply multi-views manager tool based on Objective-C which supports left-right direction slip.
                   DESC

  s.homepage     = "https://github.com/JanmyLo/LZMSideslipManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "娄忠明-JanmyLo" => "JanmyLo@126.com" }
  s.source       = { :git => "https://github.com/JanmyLo/LZMSideslipManager.git", :tag => "v#{s.version}" }
  s.platform     = :ios, "8.0"
  s.source_files  = "LZMSideslipController", "LZMSideslipManager/*.{h,m}"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
