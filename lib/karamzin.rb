require 'active_support'
require 'karamzin/version'
require 'karamzin/config'
require 'karamzin/dictionary'
require 'karamzin/words_helper'
require 'yaml'

module Karamzin
  include WordsHelper
  include Config

  E_LETTER = 'е'
  YO_LETTER = 'ё'
  BIG_E_LETTER = 'Е'
  BIG_YO_LETTER = 'Ё'

  def insert(str)
    @dictionary = Dictionary.new 'dictionary'
    words = filter_words str.split
    words.each do |word|
      index_in_dictionary = @dictionary.is_in_dictionary word
      if index_in_dictionary
        word_with_yo = make_word_with_yo(word, index_in_dictionary)
        index = str.index word
        next if index.nil?
        str.gsub! str[index..(index + word.length - 1)], equate_words_register(word, word_with_yo)
      end
    end
    str
  end

  def make_word_with_yo(word, index_in_dictionary)
    word_with_yo = @dictionary[first_letter_in(word)][index_in_dictionary]
    index = @dictionary.indexes[first_letter_in(word)][index_in_dictionary].to_i
    letter = word[index]
    if letter == E_LETTER
      word_with_yo[index] = YO_LETTER
    elsif letter == BIG_E_LETTER
      word_with_yo[index] = BIG_YO_LETTER
    end
    word_with_yo
  end
end
