# frozen_string_literal: true

Cognito.setup do |config|
  config.redirect_uri  = "http://localhost/callbacks/auth"
  config.sign_out_uri  = "http://localhost/callbacks/sign_out"
  config.pool_id        = 'eu-central-1_tnFBrRXpt'
  config.region         = 'eu-central-1'
  config.client_id      = '78vf8tsuipphs7ptbs2i2ijjeg'
  config.domain         = 'vehiculum-core-staging'
end
