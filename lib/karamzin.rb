require 'karamzin/version'
require 'karamzin/config'
require 'yaml'

module Karamzin
  include Config

  def initialize_dictionaries
    @dictionaryE = YamlLoader.yaml_object('dictionaryE')[:words]
    @dictionary = YamlLoader.yaml_object('dictionary')[:words]
  end

  def insert(str)
    words = filter_words str.split
    paste_words = []
    words.each_with_index do |word, i|
      if is_in_dictionary word
        paste_words << {
          replace_word: word,
          paste_word: @dictionary[is_in_dictionary(word)]
        }
      end
    end
    paste_words.uniq!
    paste_words.each do |word|
      index = str.index word[:replace_word]
      str.sub! str[index, index + word[:replace_word].length], equate_words_register(word[:replace_word], word[:paste_word])
    end
    str
  end

  def is_in_dictionary(word)
    @dictionaryE.index word.mb_chars.downcase.wrapped_string
  end

  def equate_words_register(wordE, word)
    unless wordE == word
      wordE.split('').each_with_index do |c, i|
        unless wordE[i] == word[i]
          if word[i] == 'ё'
            word[i] = 'Ё'
          else
            word[i] = word[i].mb_chars.uppercase.wrapped_string
          end
        end
      end
    end
    word
  end

  def filter_words(words)
    words.map { |w| w[/[а-яА-ЯЁё\-]+/] }.compact
  end
end
