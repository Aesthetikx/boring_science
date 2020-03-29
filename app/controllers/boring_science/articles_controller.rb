require_dependency 'boring_science/application_controller'

module BoringScience
  class ArticlesController < ApplicationController
    before_action :set_blog
    before_action :set_article, except: %i[index new create]

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

    def show; end

    def edit; end

    def update
      if @article.update(article_params)
        redirect_to article_path(@article.id)
      else
        flash.now[:error] = @article.errors.full_messages
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_blog
      @blog = OpenStruct.new(title: 'Default Blog')
    end

    def articles
      BoringScience::Article.all
    end

    def set_article
      @article = articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end
  end
end
