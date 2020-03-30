require_dependency 'boring_science/application_controller'

module BoringScience
  class ArticlesController < ApplicationController
    before_action :set_article, except: %i[index new create]
    before_action :set_author, only: %i[new create edit update]

    def index
      @articles = articles.order(created_at: :desc)
    end

    def new
      @article = articles.build
    end

    def create
      @article = articles.build(article_params)
      @article.author = @author

      if @article.save
        redirect_to article_path(@article)
      else
        flash.now[:error] = @article.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end

    def show; end

    def edit; end

    def update
      if @article.update(article_params)
        redirect_to article_path(@article)
      else
        flash.now[:error] = @article.errors.full_messages
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @article.destroy
        flash[:success] = 'Article deleted successfully.'
        redirect_to articles_path
      else
        flash.now[:error] = @article.errors.full_messages
        render :show, status: :unprocessable_entity
      end
    end

    private

    def articles
      blog = boring_science_blog.blog

      blog_articles = BoringScience::Article.where(blog: blog)

      published_articles = blog_articles.published

      user_articles = if boring_science_user
                        blog_articles.where(author: boring_science_user)
                      else
                        blog_articles.none
                      end

      published_articles.or(user_articles)
    end

    def set_article
      @article = articles.find_by!(slug: params[:slug])
    end

    def set_author
      @author = boring_science_user
      raise ActiveRecord::RecordNotFound unless @author
    end

    def article_params
      params.require(:article)
            .permit(:title, :summary, :body, :publication_date)
    end
  end
end
