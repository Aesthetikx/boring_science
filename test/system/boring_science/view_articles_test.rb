require 'application_system_test_case'

class ViewArticlesTest < ApplicationSystemTestCase
  test 'visiting the blog index' do
    visit '/blog'

    # Blog Title
    assert_selector 'h1', text: 'Blog'

    article = BoringScience::Article.first

    # Article Title
    assert_text article.title
  end
end
