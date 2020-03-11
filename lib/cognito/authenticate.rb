module Cognito
  module Authenticate
    extend self

    def sign_in_token(code)
      response = lookup_auth_code(code)
      unless response
        return
      end
      response
    end

    def refresh_token(current_refresh_token)
      params = {
        ClientId: Cognito.client_id,
        AuthFlow: 'REFRESH_TOKEN_AUTH',
        AuthParameters: {
          REFRESH_TOKEN: current_refresh_token,
          SECRET_HASH: Cognito.client_secret
        }
      }

      hdrs = {
        "X-Amz-Target": "AWSCognitoIdentityProviderService.InitiateAuth",
        "Content-Type": "application/x-amz-json-1.1"
      }

      resp = ::Excon.post(Cognito::Routes.refresh_token_uri,
      :headers => hdrs,
      :body => params.to_json)

      if resp.status != 200
        return nil
      end

      json = ::JSON.parse(resp.body)

      tokens = {
        'id_token' => json['AuthenticationResult']['IdToken'],
        'access_token' => json['AuthenticationResult']['AccessToken']
      }

      Cognito::Tokens.new(Cognito::Keys.keys, tokens)
    end

    private

    def lookup_auth_code(code)
      params = {
        grant_type: 'authorization_code',
        code: code,
        client_id: Cognito.client_id,
        redirect_uri: Cognito.redirect_uri
      }

      resp = ::Excon.post(Cognito::Routes.token_uri,
                        :user => Cognito.client_id,
                        :password => Cognito.client_secret,
                        :body => ::URI.encode_www_form(params),
                        :headers => { "Content-Type" => "application/x-www-form-urlencoded"})

      Cognito::Tokens.new(Cognito::Keys.keys, ::JSON.parse(resp.body))
    end
  end
end
