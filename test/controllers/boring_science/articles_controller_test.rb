require 'test_helper'

module BoringScience
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    def articles
      BoringScience::Article.where(blog: 'default')
    end

    test 'should get index' do
      get articles_url
      assert_response :success
    end

    test 'should get show' do
      article = articles.first!
      get article_url(article)
      assert_response :success
    end

    test 'should get new' do
      get new_article_url
      assert_response :success
    end

    test 'should post create successful' do
      post articles_url, params: { article: { title: 'Title', body: 'Body' } }
      article = articles.last!
      assert_redirected_to article_url(article)
    end

    test 'should post create failure' do
      post articles_url, params: { article: { title: 'Title' } }
      assert_response :unprocessable_entity
    end

    test 'should get edit' do
      article = articles.last!
      get edit_article_url(article)
      assert_response :success
    end

    test 'should patch update' do
      article = articles.last!
      patch article_url(article), params: {
        article: { title: 'New Title', body: 'New Body' }
      }
      assert_redirected_to article_url(article.reload)
    end

    test 'should delete destroy' do
      article = articles.last!
      delete article_url(article)
      assert_redirected_to articles_url
    end
  end
end
