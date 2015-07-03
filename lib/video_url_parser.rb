require "video_url_parser/version"

module VideoURLParser
  def self.parse(url)
    match = url.match(/(?:v=)(?<id>[\w\-]{11})/)
    return nil unless match

    {
      id: match[:id]
    }
  end
end
