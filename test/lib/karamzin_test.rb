require 'test_helper'

include Karamzin

class KaramzinTest < TestCase
  def test_insert
    assert_equal 'Ёлки, палки', Karamzin.insert('Елки, палки')
    #assert_equal 'В лесу родилась ёлочка!', Karamzin.insert('В лесу родилась елочка!')
    #assert_equal 'В лесу родилась ёлочка ёлочка!', Karamzin.insert('В лесу родилась елочка елочка!')
    str = ''
    #(0..1000).each do
    #  str += 'В лесу родилась елочка! '
    #end
    #assert Karamzin.insert(str)
  end
end
