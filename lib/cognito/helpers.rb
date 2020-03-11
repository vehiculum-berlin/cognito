module Cognito
  module Helpers
    LOGIN_PATH = "/login"
    LOGOUT_PATH = "/logout"
    SIGNUP_PATH = "/signup"

    class << self
      def sign_in_path
        path = "%s?response_type=code&client_id=%s&redirect_uri=%s" %
              [LOGIN_PATH, Cognito.client_id, Cognito.redirect_uri]
        ::URI.join(Cognito::Routes.oauth_uri, path).to_s
      end

      def sign_up_path
        path = "%s?response_type=code&client_id=%s&redirect_uri=%s" %
              [SIGNUP_PATH, Cognito.client_id, Cognito.redirect_uri]
        ::URI.join(Cognito::Routes.oauth_uri, path).to_s
      end

      def sign_out_path
        path = "%s?response_type=code&client_id=%s&logout_uri=%s" %
              [LOGOUT_PATH, Cognito.client_id, Cognito.sign_out_uri]
        ::URI.join(Cognito::Routes.oauth_uri, path).to_s
      end
    end
  end
end
