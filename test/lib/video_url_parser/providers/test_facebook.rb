require 'test_helper'

class TestFacebookProvider < MiniTest::Test
  def test_supported?
    assert(VideoURLParser::Providers::Facebook.supported? 'https://facebook.com')
    assert(VideoURLParser::Providers::Facebook.supported? 'http://facebook.com')
    assert(VideoURLParser::Providers::Facebook.supported? 'https://www.facebook.fr')
    assert(VideoURLParser::Providers::Facebook.supported? 'http://www.facebook.fr')
    assert(VideoURLParser::Providers::Facebook.supported? 'https://www.facebook.co.uk')
    assert(VideoURLParser::Providers::Facebook.supported? 'http://www.facebook.co.uk')
    assert(VideoURLParser::Providers::Facebook.supported? 'https://www.facebook.com')
    assert(VideoURLParser::Providers::Facebook.supported? 'http://www.facebook.com')
    assert(VideoURLParser::Providers::Facebook.supported? 'facebook.com')
    assert(VideoURLParser::Providers::Facebook.supported? 'facebook.fr')
    assert(VideoURLParser::Providers::Facebook.supported? 'facebook.co.uk')

    refute(VideoURLParser::Providers::Facebook.supported? 'https://www.facebook')
    refute(VideoURLParser::Providers::Facebook.supported? 'http://youtube.com')
    refute(VideoURLParser::Providers::Facebook.supported? 'https://youtube.com')
    refute(VideoURLParser::Providers::Facebook.supported? 'http://www.youtube.com')
    refute(VideoURLParser::Providers::Facebook.supported? 'https://www.youtube.com')
    refute(VideoURLParser::Providers::Facebook.supported? 'https://youtu.be')
    refute(VideoURLParser::Providers::Facebook.supported? 'http://www.youtube.com/facebook')
    refute(VideoURLParser::Providers::Facebook.supported? 'https://www.youtube.com/facebook')
    refute(VideoURLParser::Providers::Facebook.supported? 'http://dailymotion.com')
    refute(VideoURLParser::Providers::Facebook.supported? 'http://vimeo.com')
  end

  def test_parse
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
    assert_equal(
      VideoURLParser.parse('https://www.facebook.com/video.php?set=vb.100006285636055&v=1585710788315094&type=2&theater'),
      id: '1585710788315094', provider: :facebook
    )
    assert_equal(
      VideoURLParser.parse('https://www.facebook.com/video.php?v=1585710788315094&set=vb.100006285636055&type=2&theater'),
      id: '1585710788315094', provider: :facebook
    )
  end
end
