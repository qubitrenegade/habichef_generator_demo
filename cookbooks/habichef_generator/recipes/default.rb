#
# Cookbook:: habichef_generator
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

extend HabiChefGenerator::HabiChefHelpers

# root dir
directory cookbook_dir
# rest of dirs
%w(habitat policyfiles).each do |dir|
  directory File.join cookbook_dir, dir
end

# our base files
%w(
  habitat/default.toml
  habitat/plan.sh
  habitat/README.md 
  policyfiles/base.rb
).each do |name|
  template File.join cookbook_dir, name do
    helpers HabiChefGenerator::HabiChefHelpers
    source "#{name}.erb"
    action :create_if_missing
  end
end

# LICENSE
template "#{cookbook_dir}/LICENSE" do
  extend HabiChefGenerator::HabiChefHelpers
  helpers HabiChefGenerator::HabiChefHelpers
  source "LICENSE.#{license}.erb"
  action :create_if_missing
end

# CHANGELOG
template "#{cookbook_dir}/CHANGELOG.md" do
  action :create_if_missing
end

# Inspec
directory "#{cookbook_dir}/test/integration/default" do
  recursive true
end

template "#{cookbook_dir}/test/integration/default/default_test.rb" do
  source 'inspec_default_test.rb.erb'
  action :create_if_missing
end

