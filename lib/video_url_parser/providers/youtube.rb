module VideoURLParser
  module Providers
    module YouTube
      def self.supported?(url)
        domains = ['youtube', 'youtu']
        domains.any? do |domain|
          regex = %r{^
            (?:
              (?:https?:)?     # allow optional http: or https: scheme
             //)?              # We can assume a scheme if none is provided.
            (?:(?:[\w.])+\.)?  # can have any number of subdomains
            #{domain}          # must use the domain
            \.(?:[\w.])+       # and some TLD, sub-TLD
          }ix

          url.match(regex)
        end
      end

      def self.parse(url)
        match = url.match(/(?:(?:v|embed|be)\/|v=)(?<id>[\w\-]{11})/)
        return nil unless match

        {
          id: match[:id],
          provider: :youtube
        }
      end
    end
  end
end
