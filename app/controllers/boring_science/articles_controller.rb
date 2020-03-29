require_dependency 'boring_science/application_controller'

module BoringScience
  class ArticlesController < ApplicationController
    before_action :set_blog

    def index
      @articles = articles.order(created_at: :desc)
    end

    def show
      @article = articles.find(params[:id])
    end

    private

    def set_blog
      @blog = OpenStruct.new(title: 'Default Blog')
    end

    def articles
      BoringScience::Article.all
    end
  end
end
