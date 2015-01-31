module Karamzin
  module WordsHelper
    def filter_words(words)
      words.map { |w| w[/[а-яА-ЯЁё\-]+/] }.compact
    end

    def equate_words_register(wordE, word)
      unless wordE == word
        wordE.split('').each_with_index do |c, i|
          unless wordE[i] == word[i]
            if word[i] == YO_LETTER
              if wordE[i] == BIG_E_LETTER
                word[i] = BIG_YO_LETTER
              else
                next
              end
            else
              word[i] = UnicodeUtils.upcase word[i]
            end
          end
        end
      end
      word
    end

    def first_letter_in(word)
      letter = word[0].mb_chars.downcase.to_s
      letter == YO_LETTER ?  E_LETTER : letter
    end
  end
end
