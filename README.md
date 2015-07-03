# VideoURLParser

Parse out information from a web video URL.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'video_url_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install video_url_parser

## Usage

```ruby
VideoURLParser.parse('http://youtube.com/watch?v=5Qg6G7I4RS4#t=2m32s
# => { id: '5Qg6G7I4RS4' }

VideoURLParser.parse('https://example.com')
# => nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake rspec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/mkenyon/video_url_parser.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

