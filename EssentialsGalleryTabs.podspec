#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "EssentialsGalleryTabs"
  s.version          = '0.1.0'
  s.summary          = "<Summary>"
  s.description      = <<-DESC
                       <Description>
                       DESC
  s.homepage         = "http://www.shinobicontrols.com"
  s.license          = 'Apache License, Version 2.0'
  s.author           = { "Daniel Allsop" => "dallsop@shinobicontrols.com" }
  s.source           = { :git => "git@bitbucket.org:shinobicontrols/play-essentials-tabs.git", 
                         :tag => s.version.to_s,
                         :submodules => true 
                       }
  s.social_media_url = 'https://twitter.com/shinobicontrols'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'EssentialsGalleryTabs/EssentialsGalleryTabs/**/*.{h,m}'
  s.dependency 'ShinobiPlayUtils'
  s.resources = ['EssentialsGalleryTabs/**/*.storyboard', 'EssentialsGalleryTabs/**/*.xib', 'EssentialsGalleryTabs/**/*.xcassets']
  s.frameworks = 'QuartzCore', 'ShinobiEssentials>'
  s.xcconfig     = { 'FRAMEWORK_SEARCH_PATHS' => '"$(DEVELOPER_FRAMEWORKS_DIR)" "$(PROJECT_DIR)/../"' }
end
