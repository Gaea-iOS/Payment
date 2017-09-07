#
# Be sure to run `pod lib lint HuayingPayment.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HuayingPayment'
  s.version          = '0.1.2'
  s.summary          = 'HuayingPayment Module including wechat and alipay'
  s.description      = <<-DESC
                        TODO: fuck
                       DESC

  s.homepage         = 'https://github.com/lzc1104/HuayingPayment'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lzc1104' => '527004184@QQ.COM' }
  s.source           = { :git => 'https://github.com/lzc1104/HuayingPayment.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'HuayingPayment/*.swift'
  s.subspec 'Alipay' do |as|
    as.vendored_frameworks = 'HuayingPayment/Alipay/*.framework'
    as.source_files = 'HuayingPayment/Alipay/*'
    as.public_header_files = 'HuayingPayment/Alipay/*.h'
    as.frameworks = 'UIKit' , 'CoreTelephony','SystemConfiguration' , 'QuartzCore' , 'CoreText' , 'CoreGraphics' , 'CFNetwork' , 'CoreMotion'
    as.libraries = 'c++' , 'z'
  end

end
