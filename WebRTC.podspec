#
# Be sure to run `pod lib lint WebRTC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WebRTC'
  s.version          = '1.1.2940'
  s.summary          = 'WebRTC framework for DiyalogEngine.'
  s.homepage         = 'https://github.com/diyalog-im/WebRTC'
  s.license          = { :type => 'http://www.webrtc.org/license-rights/license', :file => 'LICENSE' }
  s.author           = { 'Diyalog' => 'diyalog-im@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/diyalog-im/WebRTC.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.public_header_files = "WebRTC/WebRTC.framework/Headers/*.h"
  s.source_files     = "WebRTC/WebRTC/Headers/*.h"

  
  s.prepare_command = <<-CMD
      echo 'fetching WebRTC.framework'
      curl -OL 'https://diyalog.im/app/pkgs/ios_frameworks/WebRTC/1.1.2940/WebRTC.zip'
      rm -fr 'WebRTC.framework'
      echo 'unzipping WebRTC.framework'
      unzip -o -q WebRTC.zip
      echo 'cleaning files'
      rm WebRTC.zip
    CMD

  s.vendored_frameworks = 'WebRTC.framework'

  s.xcconfig = {
     "FRAMEWORK_SEARCH_PATHS" => "${PODS_ROOT}/WebRTC",
     "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/WebRTC"
	
  }
  
end
