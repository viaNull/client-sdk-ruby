# frozen_string_literal: true

require_relative "lib/platon/version"

Gem::Specification.new do |spec|
  spec.name          = "platon"
  spec.version       = Platon::VERSION
  spec.authors       = ["vianull"]
  spec.email         = ["vianull@outlook.com"]

  spec.summary       = "TOD: Write a short summary, because RubyGems requires one."
  # spec.description   = "TOD: Write a longer description or delete this line."
  # spec.homepage      = "TOD: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TOD: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TOD: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "eth", "~> 0.4"

  spec.add_dependency "activesupport", ">= 4.0"
  spec.add_dependency "digest-sha3", "~> 1.1"
  spec.add_dependency 'ffi', '~> 1.0'
  spec.add_dependency 'rlp', '0.7.3'
  spec.add_dependency 'money-tree', '0.10.0'

end
