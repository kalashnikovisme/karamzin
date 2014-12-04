require 'karamzin/version'
require 'karamzin/config'
require 'yaml'

module Karamzin
  include Config

  def insert(str)
    #dictionary = YamlLoader.yaml_object 'dictionaryE'
    words = str.split
    filter_words words
  end

  def filter_words(words)
    words.map { |w| w[/[а-яА-ЯЁё\-]+/] }.compact
  end
end
