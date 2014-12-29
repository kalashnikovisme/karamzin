require 'karamzin/version'
require 'karamzin/config'
require 'yaml'

module Karamzin
  include Config

  def insert(str)
    @dictionaryE = YamlLoader.yaml_object('dictionaryE')[:words]
    words = filter_words str.split
    dic_words = []
    words.map do |word|
      if is_in_dictionary? word
        dic_words << word
      end
    end
    dic_words
  end

  def is_in_dictionary?(word)
    @dictionaryE.include? word.mb_chars.downcase.wrapped_string
  end

  def filter_words(words)
    words.map { |w| w[/[а-яА-ЯЁё\-]+/] }.compact
  end
end
