require "httparty"
require "json"
require "json/jwt"
require "uri"

module Cognito
  extend ActiveSupport::Autoload

  autoload :Authenticate
  autoload :Routes
  autoload :Tokens
  autoload :Keys
  autoload :Helpers

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

require 'cognito/railtie' if defined?(Rails)
