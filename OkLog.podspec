Pod::Spec.new do |s|
  s.name             = 'OkLog'
  s.version          = '0.0.1'
  s.homepage         = 'https://github.com/diegotl/OkLog-iOS'
  s.summary          = 'A network logger for iOS.'
  s.swift_version    = '4.1'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'diegotl' => 'diego@trevisa.nl' }
  
  s.source           = { :git => 'https://github.com/diegotl/OkLog.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/diegotrevisan90'
  s.ios.deployment_target = '8.0'
  s.source_files = 'OkLog/**/*'

  s.dependency 'SwiftProtobuf'
  s.dependency 'GzipSwift'
end
