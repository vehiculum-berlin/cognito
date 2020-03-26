require 'test_helper'

class HelpersTest < ActiveSupport::TestCase
  test "sign_in_path" do
    assert_equal Cognito::Helpers.sign_in_path, "https://aws-dummy.auth.europe.amazoncognito.com/login?response_type=code&client_id=#{Cognito.client_id}&redirect_uri=#{Cognito.redirect_uri}"
  end

  test "sign_up_path" do
    assert_equal Cognito::Helpers.sign_up_path, "https://aws-dummy.auth.europe.amazoncognito.com/signup?response_type=code&client_id=#{Cognito.client_id}&redirect_uri=#{Cognito.redirect_uri}"
  end

  test "sign_out_path" do
    assert_equal Cognito::Helpers.sign_out_path, "https://aws-dummy.auth.europe.amazoncognito.com/logout?response_type=code&client_id=#{Cognito.client_id}&logout_uri=#{Cognito.sign_out_uri}"
  end
end
