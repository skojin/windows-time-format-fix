require 'test/unit'
require File.dirname(__FILE__) + '/../init'

class WindowsTimeFormatFixTest < Test::Unit::TestCase
  def test_hour_12
    assert_equal '12', Time.utc(2007, 01, 1, 12).strftime('%l')
    assert_equal '12', Time.utc(2007, 01, 1, 0).strftime('%l')
    assert_equal '1', Time.utc(2007, 01, 1, 13).strftime('%l')
    assert_equal '1', Time.utc(2007, 01, 1, 1).strftime('%l')
  end
  
  def test_hour_24
    assert_equal '12', Time.utc(2007, 01, 1, 12).strftime('%k')
    assert_equal '0', Time.utc(2007, 01, 1, 0).strftime('%k')
    assert_equal '13', Time.utc(2007, 01, 1, 13).strftime('%k')
    assert_equal '1', Time.utc(2007, 01, 1, 1).strftime('%k')
  end
  
  def test_day
    assert_equal '1', Time.utc(2007, 1, 1).strftime('%e')
    assert_equal '9', Time.utc(2007, 1, 9).strftime('%e')
    assert_equal '11', Time.utc(2007, 1, 11).strftime('%e')
    assert_equal '21', Time.utc(2007, 1, 21).strftime('%e')
  end
end
