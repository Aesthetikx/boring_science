require 'application_system_test_case'

class ViewArticlesTest < ApplicationSystemTestCase
  test 'visiting the blog index' do
    visit '/blog'

    # Blog Title
    assert_selector 'h2', text: 'Blog'

    article = BoringScience::Article.where(blog: 'default').first!

    # Article Title
    assert_selector 'a', text: article.title
  end

  test 'visiting an article' do
    article = BoringScience::Article.where(blog: 'default').first!

    visit '/blog'

    click_on article.title

    # Article Title
    assert_text article.title

    # Article Body
    assert_text article.body
  end
end
