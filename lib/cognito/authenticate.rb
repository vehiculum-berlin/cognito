module Cognito
  module Authenticate
    extend self

    class CodeNotFoundError < StandardError; end
    class InvalidRefreshToken < StandardError; end

    def sign_in_token(code)
      params = {
        grant_type: 'authorization_code',
        code: code,
        client_id: Cognito.client_id,
        redirect_uri: Cognito.redirect_uri
      }
      resp = ::HTTParty.post(Cognito::Routes.token_uri,
                        query: ::URI.encode_www_form(params),
                        headers: { "Content-Type" => "application/x-www-form-urlencoded"})
      response_body = ::JSON.parse(resp.body)

      raise CodeNotFoundError, response_body if response_body['error'].present?

      Cognito::Tokens.new(Cognito::Keys.keys, response_body)
    end

    def refresh_token(current_refresh_token)
      params = {
        ClientId: Cognito.client_id,
        AuthFlow: 'REFRESH_TOKEN_AUTH',
        AuthParameters: {
          REFRESH_TOKEN: current_refresh_token, SECRET_HASH: Cognito.client_secret
        }
      }
      hdrs = {
        "X-Amz-Target": "AWSCognitoIdentityProviderService.InitiateAuth",
        "Content-Type": "application/x-amz-json-1.1"
      }
      response = ::HTTParty.post(
        Cognito::Routes.refresh_token_uri, :headers => hdrs, :body => params.to_json
      )
      response_body = ::JSON.parse(response.body)

      raise InvalidRefreshToken, response_body["message"] if response.code != 200

      tokens = {
        'id_token' => response_body['AuthenticationResult']['IdToken'],
        'access_token' => response_body['AuthenticationResult']['AccessToken']
      }

      Cognito::Tokens.new(Cognito::Keys.keys, tokens)
    end
  end
end
