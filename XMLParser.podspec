Pod::Spec.new do |s|

s.name         = "XMLParser"
s.version      = "1.0"
s.summary      = "A lightweight XMLParser for assembling and parsing XML values written for iOS 8+ in Swift 2. "
s.homepage     = "https://github.com/Mozharovsky/XMLParser"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "Eugene Mozharovsky" => "mozharovsky@live.com" }
s.social_media_url   = "https://twitter.com/DottieYottie"
s.platform     = :ios, "8.0"
s.ios.deployment_target = "8.0"
s.source       = { :git => "https://github.com/Mozharovsky/XMLParser.git", :tag => s.version }
s.source_files  = "XMLParser/*.swift"
s.requires_arc = true

end
