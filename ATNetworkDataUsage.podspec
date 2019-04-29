#
# Be sure to run `pod lib lint ATNetworkDataUsage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ATNetworkDataUsage'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ATNetworkDataUsage.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ankitthakur/ATNetworkDataUsage'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ankitthakur' => 'ankit.thakur@promobitech.com' }
  s.source           = { :git => 'https://github.com/ankitthakur/ATNetworkDataUsage.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'ATNetworkDataUsage/Sources/Common/**/*.{swift, h, m}'
  s.ios.source_files = 'ATNetworkDataUsage/Sources/iOS/**/*.{swift, h, m}'
  s.osx.source_files = 'ATNetworkDataUsage/Sources/OSX/**/*.{swift, h, m}'
  
  # s.resource_bundles = {
  #   'ATNetworkDataUsage' => ['ATNetworkDataUsage/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency  'ReachabilitySwift', '~> 4.3.1'
end
