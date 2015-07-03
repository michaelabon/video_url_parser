require 'test_helper'

class TestVideoURLParser < MiniTest::Test
  def test_parse_valid
    assert_equal VideoURLParser.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4&t=2m32s')[:id], '5Qg6G7I4RS4'
    assert_equal VideoURLParser.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4#t=2m32s')[:id], '5Qg6G7I4RS4'
    assert_equal VideoURLParser.parse('https://www.youtube.com/details?v=5Qg6G7I4RS4#t=2m32s')[:id], '5Qg6G7I4RS4'
    assert_equal VideoURLParser.parse('https://www.youtube.com/v/5Qg6G7I4RS4')[:id], '5Qg6G7I4RS4'
    assert_equal VideoURLParser.parse('https://m.youtube.com/watch?v=5Qg6G7I4RS4&t=2m32s')[:id], '5Qg6G7I4RS4'
    assert_equal VideoURLParser.parse('//www.youtube.com/embed/5Qg6G7I4RS4?start=152')[:id], '5Qg6G7I4RS4'
    assert_equal VideoURLParser.parse('https://youtu.be/5Qg6G7I4RS4#t=2m32s')[:id], '5Qg6G7I4RS4'
    assert_equal VideoURLParser.parse('https://youtu.be/5Qg6G7I4RS4?t=2m32s')[:id], '5Qg6G7I4RS4'
    assert_equal VideoURLParser.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4#t=2m32s')[:id], '5Qg6G7I4RS4'
  end

  def test_parse_invalid
    assert_nil VideoURLParser.parse('http://www.dailymotion.com/video/x2w6ewm_the-amazing-last-lap-of-the-visa-london-eprix_auto')
  end
end
