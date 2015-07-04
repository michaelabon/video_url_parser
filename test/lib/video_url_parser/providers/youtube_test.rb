require 'test_helper'

class TestYouTubeProvider < MiniTest::Test
  def test_supported?
    assert(VideoURLParser::Providers::YouTube.supported? 'https://youtube.com')
    assert(VideoURLParser::Providers::YouTube.supported? 'http://youtube.com')
    assert(VideoURLParser::Providers::YouTube.supported? 'https://www.youtube.fr')
    assert(VideoURLParser::Providers::YouTube.supported? 'http://www.youtube.fr')
    assert(VideoURLParser::Providers::YouTube.supported? 'https://www.youtube.co.uk')
    assert(VideoURLParser::Providers::YouTube.supported? 'http://www.youtube.co.uk')
    assert(VideoURLParser::Providers::YouTube.supported? 'https://www.youtube.com')
    assert(VideoURLParser::Providers::YouTube.supported? 'http://www.youtube.com')
    assert(VideoURLParser::Providers::YouTube.supported? 'http://youtu.be')
    assert(VideoURLParser::Providers::YouTube.supported? 'youtube.com')
    assert(VideoURLParser::Providers::YouTube.supported? 'youtube.fr')
    assert(VideoURLParser::Providers::YouTube.supported? 'youtube.co.uk')
    assert(VideoURLParser::Providers::YouTube.supported? 'youtu.be')

    refute(VideoURLParser::Providers::YouTube.supported? 'https://www.youtube')
    refute(VideoURLParser::Providers::YouTube.supported? 'http://facebook.com')
    refute(VideoURLParser::Providers::YouTube.supported? 'https://facebook.com')
    refute(VideoURLParser::Providers::YouTube.supported? 'http://www.facebook.com')
    refute(VideoURLParser::Providers::YouTube.supported? 'https://www.facebook.com')
    refute(VideoURLParser::Providers::YouTube.supported? 'http://facebook.com/youtube')
    refute(VideoURLParser::Providers::YouTube.supported? 'http://facebook.com/youtu.be')
    refute(VideoURLParser::Providers::YouTube.supported? 'http://dailymotion.com')
    refute(VideoURLParser::Providers::YouTube.supported? 'http://vimeo.com')
  end

  def test_parse
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4&t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4#t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('https://www.youtube.com/details?v=5Qg6G7I4RS4#t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('https://www.youtube.com/v/5Qg6G7I4RS4'),
      { id: '5Qg6G7I4RS4', provider: :youtube }
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('https://m.youtube.com/watch?v=5Qg6G7I4RS4&t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('//www.youtube.com/embed/5Qg6G7I4RS4?start=152'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('www.youtube.com/embed/5Qg6G7I4RS4?start=152'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('youtube.com/embed/5Qg6G7I4RS4?start=152'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('https://youtu.be/5Qg6G7I4RS4#t=2m32s'),
      { id: '5Qg6G7I4RS4', provider: :youtube }
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('https://youtu.be/5Qg6G7I4RS4?t=2m32s'),
      { id: '5Qg6G7I4RS4', provider: :youtube }
    )
    assert_equal(
      VideoURLParser::Providers::YouTube.parse('https://www.youtube.com/watch?v=5Qg6G7I4RS4#t=2m32s'),
      id: '5Qg6G7I4RS4', provider: :youtube
    )
  end
end
