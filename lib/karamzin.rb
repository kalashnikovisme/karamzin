require 'karamzin/version'
require 'karamzin/config'
require 'yaml'

module Karamzin
  include Config

  class String
    def words
      scan(/\w[\w\'\-]*/)
    end
  end

  def insert(str)
    dictionary = YamlLoader.yaml_object 'dictionaryE'
    puts str.scan
  end
end
