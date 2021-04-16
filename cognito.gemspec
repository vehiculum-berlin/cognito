$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cognito/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cognito"
  s.version     = Cognito::VERSION
  s.authors     = ["Diogo Viana"]
  s.email       = ["d.viana@vehiculum.de"]
  s.homepage    = "https://github.com/vehiculum-berlin/cognito"
  s.summary     = "AWS SSO Solution integration"
  s.description = "Making AWS Cognito SSO easy"
  s.license     = "MIT"

  s.files       = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files  = Dir["test/**/*.rb"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 5.1.6", ">= 5.1.6.2"
  s.add_dependency "httparty"
  s.add_dependency "json", ">= 2.1"
  s.add_dependency "json-jwt", "~> 1.11.0", ">= 1.11.0"

  s.add_development_dependency "pry"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-performance"
  s.add_development_dependency "rubocop-rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
end
