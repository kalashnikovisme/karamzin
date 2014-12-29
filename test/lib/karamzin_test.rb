require 'test_helper'

include Karamzin

class KaramzinTest < TestCase
  def setup
    Karamzin.initialize_dictionaries
  end
  def test_insert
    assert_equal 'Ёлки, палки', Karamzin.insert('Елки, палки')
    assert_equal 'В лесу родилась ёлочка!', Karamzin.insert('В лесу родилась елочка!')
  end
end
