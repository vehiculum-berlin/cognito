module Cognito
  module Routes
    AUTHORIZE_PATH = "/oauth2/authorize"
    TOKEN_PATH = "/oauth2/token"

    class << self
      def refresh_token_uri
        idp_uri
      end

      def authorize_uri
        URI.join(oauth_uri, AUTHORIZE_PATH).to_s
      end

      def token_uri
        URI.join(oauth_uri, TOKEN_PATH).to_s
      end

      def jwks_uri(pool_id)
        path = "/%s/.well-known/jwks.json" % [pool_id]
        URI.join(idp_uri, path).to_s
      end

      def idp_uri
        "https://cognito-idp.%s.amazonaws.com" % [Cognito.region]
      end

      def oauth_uri
        "https://%s.auth.%s.amazoncognito.com" % [Cognito.domain, Cognito.region]
      end
    end
  end
end
