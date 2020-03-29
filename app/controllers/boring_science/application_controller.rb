module BoringScience
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :boring_science_blog, :boring_science_article

    private

    def boring_science_blog
      OpenStruct.new(title: 'Default Blog')
    end

    def boring_science_article
      @article if defined? @article
    end
  end
end
