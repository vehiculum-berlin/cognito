require 'test_helper'

class Cognito::Test < ActiveSupport::TestCase
  test "config" do
    assert_equal Cognito.region, "europe"
    assert_equal Cognito.domain, "aws-dummy"
    assert_equal Cognito.pool_id, "europe_123456"
    assert_equal Cognito.redirect_uri, "http://localhost/callbacks/auth"
    assert_equal Cognito.client_secret, "123456789"
    assert_equal Cognito.client_id, "ABCDEFGH"
  end
end
