require "rails/railtie"

module Cognito
  class Railtie < Rails::Railtie
    config.eager_load_namespaces << Cognito

    config.after_initialize do
      unless Cognito.configured?
        warn '[Cognito] Cognito is not configured in the application and will not work properly.' +
          ' Use `rails generate cognito:install` to generate the Cognito configuration.'
      end

      ActionView::Base.send :include, Cognito::Helpers
    end
  end
end
