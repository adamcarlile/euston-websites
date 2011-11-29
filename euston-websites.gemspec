Gem::Specification.new do |s|
  s.name        = 'euston-websites'
  s.version     = '1.0.0'
  s.platform    = RUBY_PLATFORM.to_s == 'java' ? 'java' : Gem::Platform::RUBY
  s.authors     = ['Lee Henson', 'Guy Boertje']
  s.email       = ['lee.m.henson@gmail.com', 'guyboertje@gmail.com']
  s.summary     = %q{Common functionality for interacting with euston from websites.}
  s.description = ""
  s.homepage    = 'http://github.com/leemhenson/euston-websites'

  # = MANIFEST =
  s.files = %w[
    Gemfile
    Rakefile
    euston-websites.gemspec
    lib/euston-websites.rb
    lib/euston-websites/api_command_request_parsing/abstract_parser.rb
    lib/euston-websites/api_command_request_parsing/batch_parser.rb
    lib/euston-websites/api_command_request_parsing/discrete_parser.rb
    lib/euston-websites/api_version.rb
    lib/euston-websites/version.rb
  ]
  # = MANIFEST =

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_dependency 'activesupport',                 '>= 3.0.10'
  s.add_dependency 'hash-keys',                     '~> 1.0.1'
  s.add_dependency 'hollywood',                     '~> 1.0.0'

  s.add_development_dependency 'awesome_print',     '~> 0.4.0'
  s.add_development_dependency 'fuubar',            '~> 0.0.0'
  s.add_development_dependency 'rspec',             '~> 2.6.0'
end
