# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Cognito::Authenticate do
  describe '#sign_in_token(code)' do
    context 'authorization code has been consumed already or does not exist' do
      subject { described_class.sign_in_token('6140fbf0-f7c3-4d96-ac7b-8571abcd3c60') }

      it 'raises CodeNotFound error' do
        VCR.use_cassette('lib/authenticate/CodeNotFound') do
          expect { subject }
            .to raise_exception(Cognito::Authenticate::CodeNotFoundError, 'Auth code consumed or does not exist')
        end
      end
    end
  end

  describe '#refresh_token(current_refresh_token)' do
    context 'token is somehow broken' do
      subject { described_class.refresh_token('regular string') }

      it 'raised an error' do
        VCR.use_cassette('lib/authenticate/TokenExpired') do
          expect { subject }
            .to raise_exception(Cognito::Authenticate::InvalidRefreshToken, 'Invalid Refresh Token')
        end
      end
    end
  end
end
