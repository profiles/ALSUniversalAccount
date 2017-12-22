#
# Be sure to run `pod lib lint ALSUniversalAccount.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ALSUniversalAccount-SecondParty'
  s.version          = '0.0.1'
  s.summary          = 'A short description of ALSUniversalAccount.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/AltairEven/ALSUniversalAccount'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AltairEven' => 'qianye.qy@alibaba-inc.com' }
  s.source           = { :git => 'https://github.com/AltairEven/ALSUniversalAccount.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.pod_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/**',
    'OTHER_LDFLAGS'          => '$(inherited) -undefined dynamic_lookup',
    'ENABLE_BITCODE'         => 'NO',
    'MACH_O_TYPE'            => 'staticlib'
  }

    
  s.subspec 'Public' do |pub|
    pub.source_files = 'ALSUniversalAccount/Classes/Public/*'
  end
  s.subspec 'Interface' do |int|
    int.dependency 'ALSUniversalAccount-SecondParty/Public'
    int.vendored_frameworks = 'ALSUniversalAccount/Classes/Interface/SecondParty/*.framework'
    int.resource_bundles = {
     	'ALSUniversalAccount' => ['ALSUniversalAccount/Assets/**/*.png']
    }


    # #第三方
    int.dependency 'AEAssistant'
    int.dependency 'MJExtension', '~> 3.0.13'
    int.dependency 'TTTAttributedLabel', '~> 2.0.0'
    int.dependency 'SFHFKeychainUtils', '~> 0.0.1'
    int.dependency 'MBProgressHUD', '~> 0.9.0'
  end
  s.subspec 'Plug' do |pl|
    pl.dependency 'ALSUniversalAccount-SecondParty/Public'

    pl.vendored_frameworks = 'ALSUniversalAccount/Classes/Plug/BaiChuan/SecondParty/**/*.framework'


    # 集成新浪微博
    pl.dependency 'UMengUShare/Social/Sina'
    # 集成qq
    pl.dependency 'UMengUShare/Social/QQ'
  end
end