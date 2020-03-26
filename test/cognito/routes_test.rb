require 'test_helper'

class RoutesTest < ActiveSupport::TestCase
  test "refresh_token_uri" do
    assert_equal Cognito::Routes.refresh_token_uri, "https://cognito-idp.europe.amazonaws.com"
  end

  test "authorize_uri" do
    assert_equal Cognito::Routes.authorize_uri, "https://aws-dummy.auth.europe.amazoncognito.com/oauth2/authorize"
  end

  test "token_uri" do
    assert_equal Cognito::Routes.token_uri, "https://aws-dummy.auth.europe.amazoncognito.com/oauth2/token"
  end

  test "jwks_uri" do
    assert_equal Cognito::Routes.jwks_uri("europe_123456"), "https://cognito-idp.europe.amazonaws.com/europe_123456/.well-known/jwks.json"
  end
end
