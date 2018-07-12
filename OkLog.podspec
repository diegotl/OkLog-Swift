Pod::Spec.new do |s|
  s.name             = 'OkLog'
  s.version          = '0.1.0'
  s.homepage         = 'https://github.com/diegotl/OkLog-Swift'
  s.summary          = 'A network logger for iOS.'
  s.swift_version    = '4.1'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diego Trevisan Lara' => 'diego@trevisa.nl' }

  s.source           = { :git => 'https://github.com/diegotl/OkLog-Swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/diegotrevisan90'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.default_subspec = 'Core'

  s.subspec 'Core' do |ss|
    ss.source_files = 'OkLog/source/core/**/*'
    ss.dependency 'SwiftProtobuf'
    ss.dependency 'GzipSwift'
  end

  s.subspec 'Alamofire' do |ss|
    ss.source_files = 'OkLog/source/Alamofire/'
    ss.dependency 'OkLog/Core'
    ss.dependency 'Alamofire'
  end
end
