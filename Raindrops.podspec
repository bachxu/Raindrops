#
#  Be sure to run `pod spec lint Raindrops.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "Raindrops"
  s.version      = "1.0.0"
  s.summary      = "A custom tabBar in Swift."
  s.homepage     = "https://github.com/bachxu/Raindrops"
  s.social_media_url = "https://github.com/bachxu"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "bach" => "bach.xu@icloud.com" }
  s.source       = { :git => "https://github.com/bachxu/Raindrops.git", :tag => "#{s.version}" }
  s.ios.deployment_target = "8.0"
  s.source_files  = "Raindrops/*.swift"

end
