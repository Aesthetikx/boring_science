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

    test 'no publication date' do
      assert_not @article.published?
    end

    test 'future publication date' do
      @article.publication_date = 3.days.from_now
      assert_not @article.published?
    end

    test 'past publication date' do
      @article.publication_date = 3.days.ago
      assert @article.published?
    end
  end
end
