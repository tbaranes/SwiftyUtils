Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.name            	= "SwiftyUtils"
s.version          	= "0.7.0"
s.summary          	= "Swifty utils regroups all the boilerplate code reusable in each project."
s.description      	= "Swifty utils regroups all the boilerplate code reusable in each project, available for iOS, OSX and tvOS"
s.homepage         	= "https://github.com/tbaranes/SwiftyUtils"
s.license      		= { :type => "MIT", :file => "LICENSE" }
s.author           	= { "Tom Baranes" => "tom.baranes@gmail.com" }
s.source           	= { :git => "https://github.com/tbaranes/SwiftyUtils.git", :tag => "#{s.version}" }

# ―――  Spec tech  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.ios.deployment_target		= '8.0'
s.tvos.deployment_target 	= '9.0'
s.osx.deployment_target 	= '10.10'
s.watchos.deployment_target = '2.0'

s.requires_arc 	   			= true
s.source_files				= 'Source/*.swift'
s.ios.source_files			= 'Source/iOS/*.swift'
s.osx.source_files          = 'Source/macOS/*.swift' 

end