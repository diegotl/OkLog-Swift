Pod::Spec.new do |s|
  s.name             = 'OkLog'
  s.version          = '0.2.4'
  s.homepage         = 'https://github.com/diegotl/OkLog-Swift'
  s.summary          = 'A network logger for iOS.'
  s.swift_version    = '5.0'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diego Trevisan Lara' => 'diego@trevisa.nl' }

  s.source           = { :git => 'https://github.com/diegotl/OkLog-Swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/diegotrevisan90'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.default_subspec = 'Core'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Sources/Core/**/*'
    ss.dependency 'SwiftProtobuf'
    ss.dependency 'GzipSwift'
  end

  s.subspec 'Alamofire' do |ss|
    ss.source_files = 'Sources/Alamofire/**/*'
    ss.dependency 'OkLog/Core'
    ss.dependency 'Alamofire'
  end
end
