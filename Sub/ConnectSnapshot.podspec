Pod::Spec.new do |s|
    s.name = 'ConnectSnapshot'
    s.version = '3.9.0'
    s.summary = 'Snapshot utility for Connect framework.'
    s.homepage = 'https://gitlab.com/commencis-ios/Connect-SDK-iOS/'

    s.author = { 'iOS Developers' => 'iosdevelopers@commencis.com' }
    s.license = { :type => 'Commencis', :file => 'LICENSE' }

    s.platform = :ios
    s.source = { :git => 'https://gitlab.com/commencis-ios/Connect-SDK-iOS.git', :tag => s.version.to_s }

    s.ios.deployment_target = '11.0'
    s.ios.vendored_frameworks = 'Sub/ConnectSnapshot.xcframework'
end
