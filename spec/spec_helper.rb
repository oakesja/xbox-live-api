$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'xbox_live_api'

if ENV['TEST_ENV'] == 'TRAVIS'
  require 'coveralls'
  Coveralls.wear!
end
