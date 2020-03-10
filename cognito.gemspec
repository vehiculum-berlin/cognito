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
  s.add_dependency "excon", ">= 0.16.0", "< 0.73"
  s.add_dependency "json-jwt", "~> 1.11.0", ">= 1.11.0"
end
