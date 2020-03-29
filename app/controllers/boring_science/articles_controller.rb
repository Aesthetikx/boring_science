require_dependency 'boring_science/application_controller'

module BoringScience
  class ArticlesController < ApplicationController
    before_action :set_blog

    def index
      @articles = articles.order(created_at: :desc)
    end

    def new
      @article = articles.build
    end

    def create
      @article = articles.build(article_params)

      if @article.save
        redirect_to article_path(@article.id)
      else
        flash.now[:error] = @article.errors.full_messages
        render :new, status: :unprocessable_entity
      end
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

    def article_params
      params.require(:article).permit(:title, :body)
    end
  end
end
