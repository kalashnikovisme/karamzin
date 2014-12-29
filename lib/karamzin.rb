require 'karamzin/version'
require 'karamzin/config'
require 'yaml'

module Karamzin
  include Config

  def insert(str)
    @dictionaryE = YamlLoader.yaml_object('dictionaryE')[:words]
    @dictionary = YamlLoader.yaml_object('dictionary')[:words]
    words = filter_words str.split
    words.each_with_index do |word, i|
      if is_in_dictionary word
        words[i] = @dictionary[is_in_dictionary(word)]
      end
    end
    words
  end

  def is_in_dictionary(word)
    @dictionaryE.index word.mb_chars.downcase.wrapped_string
  end

  def filter_words(words)
    words.map { |w| w[/[а-яА-ЯЁё\-]+/] }.compact
  end
end
