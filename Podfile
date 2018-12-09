# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

target 'aircredit' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for aircredit

  pod 'Fabric'
  pod 'Crashlytics'
  pod 'FlowingMenu'

  target 'aircreditTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'aircreditUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['FlowingMenu'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.0'
      end
    end
  end
end
