# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name                  = 'hello_world'
  s.version               = '0.1.0'
  s.summary               = 'Hello World in 74 languages as an example of an internal Gem for the Ruby-Monorepo project.'
  s.description           = 'Provides a CLI and Ruby API to print "Hello World" in one of 74 supported languages. Used to test building gems by the Bazel rules_ruby project.'
  s.authors               = ['Konstantin Gredeskoul', 'Bazel Ruby Authors']
  s.bindir                = 'exe'
  s.files                 = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.executables           = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.homepage              = 'https://github.com/bazelruby/ruby-monorepo/gems/hello_world'
  s.require_paths         = ['lib']
  s.required_ruby_version = '>= 2.3'

  s.add_dependency('colored2')

  s.add_development_dependency('rake')
  s.add_development_dependency('relaxed-rubocop')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rubocop', '>= 0.73')
  s.add_development_dependency('simplecov')
  s.add_development_dependency('simplecov-formatter-badge')

  s.metadata['allowed_push_host'] = ''
end
