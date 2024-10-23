version = "1.26.0-pull-request-2e547e90a53aa07286cb5636cb9eee2fddf487e6"
repo = "ContentSquare/CSSwiftProtobuf"

Pod::Spec.new do |s|
    s.name = 'CSSwiftProtobuf'
    s.version = version
    s.source = { :http => "https://github.com/#{repo}/releases/download/#{version}/package.zip", :type => 'zip' }

    s.summary = 'Vendored version of Swift Protobuf Runtime Library'
    s.homepage = 'https://github.com/apple/swift-protobuf'
    s.author = 'Apple Inc.'
    s.license = { :type => 'Apache 2.0', :file => 'LICENSE.txt' }

    s.ios.deployment_target = '11.0'
    s.osx.deployment_target = '10.13'
    s.tvos.deployment_target = '11.0'
    s.watchos.deployment_target = '4.0'

    s.requires_arc = true
    s.cocoapods_version = '>= 1.7.0'

    s.vendored_frameworks = [ 'CSSwiftProtobuf.xcframework' ]

    s.swift_versions = ['5.0']
end
