require File.expand_path("lib/version", __dir__)

Gem::Specification.new do |spec|
  spec.name          = "base58"
  spec.version       = Base58::VERSION
  spec.authors       = ["Nixxlab team"]
  spec.email         = ["nixxlab@gmail.com"]
  spec.summary       = "An efficient digital signature library providing the Ed25519 algorithm"
  spec.description   = "A Ruby binding to the Ed25519 elliptic curve public-key signature system described in RFC 8032."
  spec.homepage      = "https://github.com/nixxlab/base58"
  spec.license       = "MIT"
  spec.files         = Dir["lib/**/*", "LICENSE"]
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = ["README.md"]

  spec.platform   = Gem::Platform::RUBY
  spec.extensions = []

  spec.required_ruby_version = ">= 2.4.0"
  spec.add_development_dependency "bundler"
end