require 'minitest/autorun'
require 'minitest/reporters'
require 'video_url_parser'

reporter_options = { :color => true }
Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new(reporter_options)
]
