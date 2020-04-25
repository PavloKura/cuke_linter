
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cuke_linter/version"

Gem::Specification.new do |spec|
  spec.name          = "cuke_linter"
  spec.version       = CukeLinter::VERSION
  spec.authors       = ["Eric Kessler"]
  spec.email         = ["morrow748@gmail.com"]

  spec.summary       = %q{Lints feature files used by Cucumber and other similar frameworks.}
  spec.homepage      = 'https://github.com/enkessler/cuke_linter'
  spec.license       = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    source_controlled_files = `git ls-files -z`.split("\x0")
    source_controlled_files.keep_if { |file| file =~ %r{^(lib|exe|testing/cucumber/features)} } + ['README.md', 'LICENSE.txt', 'CHANGELOG.md', 'cuke_linter.gemspec']
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'

  spec.add_runtime_dependency 'cuke_modeler', '>= 1.5', '< 3.0'

  spec.add_development_dependency "bundler", "< 3.0"
  spec.add_development_dependency "cucumber", "~> 3.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "require_all", "~> 2.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'simplecov', '< 1.0.0'
  spec.add_development_dependency 'coveralls', '< 1.0.0'
  spec.add_development_dependency 'rainbow', '< 4.0.0'
  spec.add_development_dependency 'rubocop', '< 1.0.0'
  spec.add_development_dependency 'parallel', '~> 1.0'
  spec.add_development_dependency 'childprocess', '~> 3.0'
  spec.add_development_dependency 'ffi', '~> 1.0'
  spec.add_development_dependency 'cuke_slicer', '>= 2.0.2', '< 3.0'
end
