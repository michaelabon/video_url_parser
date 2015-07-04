require 'video_url_parser/version'

require 'video_url_parser/providers/facebook'
require 'video_url_parser/providers/youtube'

module VideoURLParser
  PROVIDERS = [
    VideoURLParser::Providers::YouTube,
    VideoURLParser::Providers::Facebook
  ].freeze

  def self.parse(url)
    PROVIDERS.each do |provider|
      return provider.parse(url) if provider.supported?(url)
    end

    nil
  end
end
