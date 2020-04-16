
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "benning_violins/version"

Gem::Specification.new do |spec|
  spec.name          = "benning_violins"
  spec.version       = BenningViolins::VERSION
  spec.authors       = ["'Monica Gerard'"]
  spec.email         = ["'mlgerardvla@gmail.com'"]

  spec.summary       = %q{"Summary"}
  spec.description   = %q{"A longer description"}
  spec.homepage      = "https://github.com/mlgvla/benning_violins"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage = "https://github.com/mlgvla/benning_violins"
    spec.metadata["source_code_uri"] = "https://github.com/mlgvla/benning_violins"
   # spec.metadata["changelog_uri"] = "https://github.com/mlgvla/benning_violins"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
  spec.add_dependency "word_wrap"
end
