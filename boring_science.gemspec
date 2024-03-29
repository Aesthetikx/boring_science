$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'boring_science/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'boring_science'
  spec.version     = BoringScience::VERSION
  spec.authors     = ['John DeSilva']
  spec.email       = ['desilvjo@umich.edu']
  spec.homepage    = 'https://www.github.com/aesthetikx/boring_science'
  spec.summary     = 'A mountable Rails blogging engine'
  spec.description = 'A mountable Rails blogging engine'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this
  # section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  spec.add_dependency 'kramdown', '~> 2'
  spec.add_dependency 'rails', '>= 5'

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'puma'
  spec.add_development_dependency 'rubocop-rails'
  spec.add_development_dependency 'selenium-webdriver'
  spec.add_development_dependency 'sqlite3'
end
