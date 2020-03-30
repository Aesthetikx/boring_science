module BoringScience
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    helper_method :boring_science_blog, :boring_science_article

    private

    def boring_science_blog
      defaults = { title: 'Blog', blog: 'default' }
      attributes = params.to_unsafe_h.fetch(:options, {})
      OpenStruct.new(defaults.merge(attributes))
    end

    def boring_science_article
      @article if defined? @article
    end
  end
end
