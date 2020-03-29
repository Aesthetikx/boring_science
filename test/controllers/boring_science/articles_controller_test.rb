require 'test_helper'

module BoringScience
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should get index' do
      get articles_url
      assert_response :success
    end

    test 'should get show' do
      article = BoringScience::Article.first!
      get article_url(article.id)
      assert_response :success
    end

    test 'should get new' do
      get new_article_url
      assert_response :success
    end

    test 'should post create successful' do
      post articles_url, params: { article: { title: 'Title', body: 'Body' } }
      article = BoringScience::Article.last!
      assert_redirected_to article_url(article.id)
    end

    test 'should post create failure' do
      post articles_url, params: { article: { title: 'Title' } }
      assert_response :unprocessable_entity
    end
  end
end
