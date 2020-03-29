require 'application_system_test_case'

class DeleteArticlesTest < ApplicationSystemTestCase
  test 'deleting articles' do
    article = BoringScience::Article.last!

    visit '/blog'

    click_on article.title

    assert_difference('BoringScience::Article.count', -1) do
      accept_confirm { click_on 'Delete' }
      assert_text(/successfully/i)
    end
  end
end
