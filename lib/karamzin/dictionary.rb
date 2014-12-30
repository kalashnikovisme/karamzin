module Karamzin
  class Dictionary
    def initialize(name)
      @dictionary = make_dictionary name
    end

    def [](letter)
      @dictionary[letter]
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
  end
end
