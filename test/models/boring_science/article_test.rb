require 'test_helper'

module BoringScience
  class ArticleTest < ActiveSupport::TestCase
    def setup
      @article = Article.new(title: 'Title', body: 'Body')
    end

    test 'valid article' do
      assert @article.valid?
    end

    test 'invalid without title' do
      @article.body = nil
      assert_not @article.valid?
      assert_not_nil @article.errors[:body]
    end

    test 'invalid without body' do
      @article.title = nil
      assert_not @article.valid?
      assert_not_nil @article.errors[:title]
    end
  end
end
