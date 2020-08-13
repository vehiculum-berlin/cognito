module Cognito
  module User
    extend self

    def remove(username, pool)
      params = {
        Username: username,
        UserPoolId: pool
      }

      hdrs = {
        "X-Amz-Target": "AWSCognitoIdentityProviderService.AdminDeleteUser",
        "Content-Type": "application/x-amz-json-1.1"
      }

      resp = ::Excon.post(Cognito::Routes.refresh_token_uri,
      :headers => hdrs,
      :body => params.to_json)

      puts resp.inspect

    end
  end
end
