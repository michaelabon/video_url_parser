require 'test_helper'

class TestVideoURLParser < MiniTest::Test
  def test_parse_valid_youtube
    assert_equal(
      VideoURLParser.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4&t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4#t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser.parse('https://www.youtube.com/details?v=5Qg6G7I4RS4#t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser.parse('https://www.youtube.com/v/5Qg6G7I4RS4'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser.parse('https://m.youtube.com/watch?v=5Qg6G7I4RS4&t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser.parse('//www.youtube.com/embed/5Qg6G7I4RS4?start=152'),
      { id: '5Qg6G7I4RS4', provider: :youtube }
    )
    assert_equal(
      VideoURLParser.parse('www.youtube.com/embed/5Qg6G7I4RS4?start=152'),
      { id: '5Qg6G7I4RS4', provider: :youtube }
    )
    assert_equal(
      VideoURLParser.parse('youtube.com/embed/5Qg6G7I4RS4?start=152'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser.parse('https://youtu.be/5Qg6G7I4RS4#t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser.parse('https://youtu.be/5Qg6G7I4RS4?t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4#t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
  end

  def test_parse_valid_facebook
    assert_equal(
      VideoURLParser.parse('https://www.facebook.com/firstname.lastname.125/videos/10158467039730879/'),
      id: '10158467039730879', provider: :facebook
    )
    assert_equal(
      VideoURLParser.parse('https://www.facebook.com/BuzzFeed/videos/vb.21898300328/10153588150610329/?type=2&theater'),
      id: '10153588150610329', provider: :facebook
    )
    assert_equal(
      VideoURLParser.parse('http://www.facebook.com/BuzzFeed/videos/10153588150610329/'),
      id: '10153588150610329', provider: :facebook
    )
    assert_equal(
      VideoURLParser.parse('https://www.facebook.fr/BuzzFeed/videos/10153588150610329/'),
      id: '10153588150610329', provider: :facebook
    )
    assert_equal(
      VideoURLParser.parse('https://www.facebook.com/facebook/videos/10153231379946729/'),
      id: '10153231379946729', provider: :facebook
    )
    assert_equal(
      VideoURLParser.parse('www.facebook.com/facebook/videos/10153231379946729/'),
      id: '10153231379946729', provider: :facebook
    )
    assert_equal(
      VideoURLParser.parse('facebook.com/facebook/videos/10153231379946729/'),
      id: '10153231379946729', provider: :facebook
    )
  end

  def test_parse_invalid
    assert_nil VideoURLParser.parse('http://www.dailymotion.com/video/x2w6ewm_the-amazing-last-lap-of-the-visa-london-eprix_auto')
  end
end
