module Karamzin
  class String
    def uppercase(str)
      if str.match /[а-яА-яёЁ].*/
        self.mb_chars.uppercase.to_s
      end
    end
    def downcase(str)
      if str.match /[а-яА-яёЁ].*/
        self.mb_chars.downcase.to_s
      end
    end
  end
end
