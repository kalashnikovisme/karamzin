module Karamzin
  class Dictionary
    def initialize(name)
      @dictionary = make_dictionary name
    end

    def [](letter)
      @dictionary[letter]
    end

    def indexes
      @indexes
    end

    def make_dictionary(name)
      words = YamlLoader.yaml_object(name)[:words]
      variable = {}
      @indexes = {}
      words.each do |word|
        if word[0] == YO_LETTER
          variable[E_LETTER] ||= []
          variable[E_LETTER] << word.split(' ')[0]
          @indexes[E_LETTER] ||= []
          @indexes[E_LETTER] << word.split(' ')[1]
        else
          variable[word[0]] ||= []
          variable[word[0]] << word.split(' ')[0]
          @indexes[word[0]] ||= []
          @indexes[word[0]] << word.split(' ')[1]
        end
      end
      variable
    end

    def is_in_dictionary(word)
      if @dictionary[word[0].mb_chars.downcase.to_s]
        if word[0] == YO_LETTER
          word[0] = E_LETTER
          @dictionary[E_LETTER].index word.mb_chars.downcase.to_s
        else
          @dictionary[word[0].mb_chars.downcase.to_s].index word.mb_chars.downcase.to_s
        end
      end
    end
  end
end
