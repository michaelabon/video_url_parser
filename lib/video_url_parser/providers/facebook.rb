module VideoURLParser
  module Providers
    module Facebook
      def self.supported?(url)
        domains = ['facebook']
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
        match = url.match(%r{
          /videos/             # every URL starts with /videos/
          (?:vb\.\d{11,}/)?    # Pages' videos start with vb. and their account id number
          (?<id>\d{16,})       # The video id!
        }ix)
        return nil unless match

        {
          id: match[:id],
          provider: :facebook
        }
      end
    end
  end
end
