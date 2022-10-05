Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.name            	= "SwiftyUtils"
s.version          	= "5.5.2"
s.summary          	= "Swifty utils regroups all the boilerplate code reusable in each project."
s.description      	= "Swifty utils regroups all the boilerplate code reusable in each project, available for iOS, macOS and tvOS"
s.homepage         	= "https://github.com/tbaranes/SwiftyUtils"
s.license      		= { :type => "MIT", :file => "LICENSE" }
s.author           	= { "Tom Baranes" => "tom.baranes@gmail.com" }
s.source           	= { :git => "https://github.com/tbaranes/SwiftyUtils.git", :tag => "#{s.version}" }
s.swift_versions 	= "5.6"

# ―――  Spec tech  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.ios.deployment_target		= '8.0'
s.tvos.deployment_target 	= '9.0'
s.osx.deployment_target 	= '10.10'
s.watchos.deployment_target = '2.0'

s.requires_arc 	   			= true
s.source_files				= 'Sources/*.swift', 
							  'Sources/Extensions/CoreGraphics/**/*.swift',
							  'Sources/Extensions/Foundation/**/*.swift',
							  'Sources/Extensions/Swift/**/*.swift',
							  'Sources/Others/*.swift',
							  'Sources/PropertyWrappers/*.swift',
							  'Sources/Protocols/Swift/*.swift'

s.ios.source_files			= 'Sources/Protocols/UIKit/**/*.swift',
							  'Sources/Extensions/UIKit/**/*.swift'
s.osx.source_files          = 'Sources/AppKit/**/*.swift',
                              'Sources/Others/macOS/*.swift'


end
