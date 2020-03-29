require_dependency 'boring_science/application_controller'

module BoringScience
  class ArticlesController < ApplicationController
    before_action :set_blog

    def index
      @articles = BoringScience::Article.order(created_at: :desc)
    end

    private

    def set_blog
      @blog = OpenStruct.new(title: 'Default Blog')
    end
  end
end
