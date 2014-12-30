require 'karamzin/version'
require 'karamzin/config'
require 'yaml'
#require 'active_support/core_ext'

module Karamzin
  include Config

  def insert(str)
    make_dictionaries
    words = filter_words str.split
    paste_words = []
    words.each do |word|
      index_in_dictionary = is_in_dictionary word
      if index_in_dictionary
        paste_words << {
          replace_word: word,
          paste_word: @dictionary[first_letter_in(word)][index_in_dictionary]
        }
      end
    end
    paste_words.uniq!
    paste_words.each do |word|
      index = str.index word[:replace_word]
      str.gsub! str[index..index + word[:replace_word].length - 1], equate_words_register(word[:replace_word], word[:paste_word])
    end
    str
  end

  def first_letter_in(word)
    letter = word[0].mb_chars.downcase.to_s
    letter == 'ё' ?  'е' : letter
  end

  def is_in_dictionary(word)
    if @dictionaryE[word[0].mb_chars.downcase.to_s]
      if word[0] == 'ё'
        word[0] = 'e'
        @dictionaryE['е'].index word.mb_chars.downcase.wrapped_string
      else
        @dictionaryE[word[0].mb_chars.downcase.to_s].index word.mb_chars.downcase.wrapped_string
      end
    end
  end

  def make_dictionaries
    @dictionary = make_dictionary 'dictionary'
    @dictionaryE = make_dictionary 'dictionaryE'
  end

  def make_dictionary(name)
    dictionary = YamlLoader.yaml_object(name)[:words]
    variable = {}
    dictionary.each do |word|
      if word[0] == 'ё'
        variable['е'] ||= []
        variable['е'] << word
      else
        variable[word[0]] ||= []
        variable[word[0]] << word
      end
    end
    variable
  end

  def equate_words_register(wordE, word)
    unless wordE == word
      wordE.split('').each_with_index do |c, i|
        unless wordE[i] == word[i]
          if word[i] == 'ё'
            if wordE[i] == 'Е'
              word[i] = 'Ё'
            else
              next
            end
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
