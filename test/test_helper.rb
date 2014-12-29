require 'bundler/setup'
if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end
require 'simplecov'
ENV["RAILS_ENV"] = "test"
SimpleCov.start('rails') if ENV["COVERAGE"]

Bundler.require

MiniTest.autorun

class TestCase < MiniTest::Test
end
