Pod::Spec.new do |s|
    s.name = 'ConnectSnapshot'
    s.version = '1.0.4'
    s.summary = 'Snapshot utility for Connect framework.'
    s.homepage = 'https://gitlab.com/commencis-ios/Connect-SDK-iOS/'

    s.author = { 'iOS Developers' => 'iosdevelopers@commencis.com' }
    s.license = { :type => 'Commencis', :file => 'LICENSE' }

    s.platform = :ios
    s.source = { :git => 'https://gitlab.com/commencis-ios/Connect-SDK-iOS.git', :tag => "snapshot-release-1.0.4" }

    s.ios.deployment_target = '8.0'
    s.ios.vendored_frameworks = 'Sub/ConnectSnapshot.framework'
end
