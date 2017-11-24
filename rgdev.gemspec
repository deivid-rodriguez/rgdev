
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rgdev/version"

Gem::Specification.new do |spec|
  spec.name          = "rgdev"
  spec.version       = Rgdev::VERSION
  spec.authors       = ["Ellen Marie Dash"]
  spec.email         = ["me@duckie.co"]

  spec.summary       = %q{Pulls in all of the dependencies for working on RubyGems.}
  spec.homepage      = "https://github.com/duckinator/rgdev"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # I'M A HELPER.

  # Install pry because it's nice. ♥
  spec.add_dependency "pry"

  # Install rdoc first, to avoid errors while installing other gems.
  spec.add_dependency "rdoc",          "~> 4.0"

  spec.add_dependency "hoe"

  # Why yes, I _did_ have to copy/paste/edit this from the RubyGems Rakefile.
  spec.add_dependency "builder",       "~> 2.1"
  spec.add_dependency "hoe-seattlerb", "~> 1.2"
  spec.add_dependency "ZenTest",       "~> 4.5"
  spec.add_dependency "rake",          "~> 10.5"
  spec.add_dependency "minitest",      "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
