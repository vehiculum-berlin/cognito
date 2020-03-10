require "cognito/railtie"
require "cognito/authenticate"
require "cognito/routes"
require "cognito/tokens"
require "cognito/keys"
require "cognito/helpers"

module Cognito

  mattr_accessor :region
  @@region = nil

  mattr_accessor :domain
  @@domain = nil

  mattr_accessor :pool_id
  @@pool_id = nil

  mattr_accessor :redirect_uri
  @@redirect_uri = nil

  mattr_accessor :sign_out_uri
  @@sign_out_uri = nil

  mattr_accessor :client_secret
  @@client_secret = nil

  mattr_accessor :client_id
  @@client_id = nil

  @@configured = false

  def self.configured?
    @@configured
  end

  def self.setup
    @@configured = true
    yield self
  end
end
