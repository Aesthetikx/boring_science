require 'kramdown'
require 'turbolinks'

module BoringScience
  class Engine < ::Rails::Engine
    isolate_namespace BoringScience
    config.assets.precompile += ['boring_science/application.js']
  end
end
