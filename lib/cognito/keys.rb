module Cognito
  module Keys
    class << self
      def keys
        resp = ::HTTParty.get(key_url)
        keys = ::JSON.parse(resp.body)
        keymap = ::Hash[keys["keys"].map {|key|
                        [key["kid"], JSON::JWK.new(key)]
                      }]
        Jwt.new(keymap)
      end

      def key_url
        Cognito::Routes.jwks_uri(Cognito.pool_id)
      end
    end

    class Jwt
      def initialize(keymap)
        @keys = keymap
      end

      def get(key_id, alg = 'RS256')
        key = @keys[key_id]

        unless key
          raise "No such JWK `#{key_id}`: #{@keys.keys}"
        end

        unless key[:alg] == alg
          raise "Algorithm not compatible #{key[:alg]} != #{alg}"
        end

        key
      end
    end
  end
end
