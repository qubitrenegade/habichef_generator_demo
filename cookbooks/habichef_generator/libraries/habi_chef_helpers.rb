#
# Chef Documentation
# https://docs.chef.io/libraries.html
#

#
# This module name was auto-generated from the cookbook name. This name is a
# single word that starts with a capital letter and then continues to use
# camel-casing throughout the remainder of the name.
#
module HabiChefGenerator
  module HabiChefHelpers
    def cookbook_dir
      node['habichef_root'] || '../demo'
    end

    def license
      node['license'] || 'all_rights'
    end

    def copyright_holder
      node['copyright_holder'] || 'The Authors'
    end

    def email
      node['email'] || 'the.authors@changeme.com'
    end

    def year
      node['copyright_year'] || Date.today.year
    end
  end
end
