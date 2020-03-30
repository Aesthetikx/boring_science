require 'application_system_test_case'

class CreateArticlesTest < ApplicationSystemTestCase
  test 'create new articles' do
    visit '/blog'

    click_on 'New Article'

    fill_in 'Title', with: (title = 'Title')
    fill_in 'Publication Date', with: Time.zone.today
    fill_in 'Body', with: (body = 'Body')

    click_on 'Create'

    article = BoringScience::Article.last!
    assert_equal title, article.title
    assert_equal body, article.body
    assert article.published?
  end
end
