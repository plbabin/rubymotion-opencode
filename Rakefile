# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  app.pods do
    pod 'AFNetworking'
  end

  # Use `rake config' to see complete project settings.
  app.name = 'Opencode'
  
  app.interface_orientations = [:portrait]
  #app.icons = ["Icon-57.png"];
  app.info_plist['CFBundleIcons'] = { 'CFBundlePrimaryIcon' => { 'UIPrerenderedIcon' => true }}
end
