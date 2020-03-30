require 'application_system_test_case'

class EditArticlesTest < ApplicationSystemTestCase
  test 'editing articles' do
    article = BoringScience::Article.where(blog: 'default').last!

    visit '/blog'

    click_on article.title

    click_on 'Edit'

    fill_in 'Title', with: (title = 'New Title')
    fill_in 'Body', with: (body = 'New Body')

    click_on 'Update'

    article.reload

    assert_equal title, article.title
    assert_equal body, article.body
  end
end
