require 'test_helper'

include Karamzin

class KaramzinTest < TestCase
  def setup
    Karamzin.initialize_dictionaries
  end
  def test_insert
    assert_equal 'Ёлки, палки', Karamzin.insert('Елки, палки')
  end
end
