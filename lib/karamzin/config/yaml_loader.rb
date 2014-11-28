require 'active_support/core_ext/hash'

module Karamzin
  module Config
    class YamlLoader
      def self.gem_root
        Gem::Specification.find_by_name('karamzin').gem_dir
      end

      def self.yaml_object(filename)
        YAML.load_file(gem_root + '/yaml/' + filename + '.yml').with_indifferent_access
      end
    end
  end
end
