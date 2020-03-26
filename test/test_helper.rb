ENV["RAILS_ENV"] = "test"

require "bundler/setup"

require "rails/all"
require "cognito"

require "minitest/utils"
require "minitest/autorun"

Cognito.setup do |config|
  config.region        = "europe"
  config.domain        = "aws-dummy"
  config.pool_id       = "europe_123456"
  config.redirect_uri  = "http://localhost/callbacks/auth"
  config.sign_out_uri  = "http://localhost/callbacks/sign_out"
  config.client_secret = "123456789"
  config.client_id     = "ABCDEFGH"
end
