#
# Be sure to run `pod lib lint ZHKKeyBoard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZHKKeyBoard'
  s.version          = '0.1.1'
  s.summary          = 'A Custom KeyBoard.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A Custom KeyBoard For UITextField And UITextView.
                       DESC

  s.homepage         = 'https://github.com/ZHK1024/ZHKKeyBoard'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZHK1024@foxmail.com' => 'zhk1024' }
  s.source           = { :git => 'https://github.com/ZHK1024/ZHKKeyBoard.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZHKKeyBoard/Classes/*.{h,m}'
  
  s.subspec 'Categroies' do |ss|
    ss.source_files = 'ZHKKeyBoard/Classes/Categroies/*.{h,m}'
    
    ss.subspec 'UITextField' do |sss|
        sss.source_files = 'ZHKKeyBoard/Classes/Categroies/UITextField+ZHKKeyBoard/*.{h,m}'
    end
    
    ss.subspec 'UITextView' do |sss|
        sss.source_files = 'ZHKKeyBoard/Classes/Categroies/UITextView+ZHKKeyBoard/*.{h,m}'
    end
  end
  
  
  s.subspec 'Views' do |ss|
    ss.source_files = 'ZHKKeyBoard/Classes/View/*.{h,m}'
    
    ss.subspec 'ZHKDatePickerKeyBoardView' do |sss|
      sss.source_files = 'ZHKKeyBoard/Classes/View/ZHKDatePickerKeyBoardView/*.{h,m}'
    end
    
    ss.subspec 'ZHKIDCardKeyBoardView' do |sss|
      sss.source_files = 'ZHKKeyBoard/Classes/View/ZHKIDCardKeyBoardView/*.{h,m}'
    end
    
    ss.subspec 'ZHKLocationKeyBoardView' do |sss|
      sss.source_files = 'ZHKKeyBoard/Classes/View/ZHKLocationKeyBoardView/*.{h,m}'
    end
    
    ss.subspec 'ZHKSelectionKeyboardView' do |sss|
      sss.source_files = 'ZHKKeyBoard/Classes/View/ZHKSelectionKeyboardView/*.{h,m}'
    end
  end
  
  s.subspec 'ZHKBlockObject' do |ss|
    ss.source_files = 'ZHKKeyBoard/Classes/ZHKBlockObject/*.{h,m}'
  end
  
  
  s.subspec 'Manager' do |ss|
      ss.source_files = 'ZHKKeyBoard/Classes/Manager/*.{h,m}'
  end
  
  s.subspec 'Defines' do |ss|
      ss.source_files = 'ZHKKeyBoard/Classes/Defines/*.{h,m}'
  end
  
  s.resource_bundles = {
    'ZHKKeyBoard' => ['ZHKKeyBoard/Assets/**']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
