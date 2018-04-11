## Import CocoaPods sources
source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!
use_frameworks!

platform :ios, '9.0'
workspace 'MyBo.xcworkspace'

## Pods shared between all the targets
def shared_with_networking_pods
    pod 'Alamofire', '4.7'
end

def shared_with_webimage_pods
    # Kingfisher is a lightweight, pure-Swift library for downloading and caching images from the web.
    pod 'Kingfisher', '~> 4.6'
end

def shared_with_json_pods
    pod 'SwiftyJSON'
end

target ‘MyBo' do
    project 'MyBo/MyBo.xcodeproj'

    shared_with_networking_pods
    shared_with_webimage_pods
    shared_with_json_pods

    # ---------------------
    # Third party libraries
    # ---------------------
    pod 'LFLiveKit'
    pod 'YYKit'
    pod 'Masonry'
end
