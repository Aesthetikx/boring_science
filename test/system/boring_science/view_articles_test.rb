require 'application_system_test_case'

class ViewArticlesTest < ApplicationSystemTestCase
  test 'visiting the blog index' do
    visit '/blog'

    assert_selector 'h1', text: 'Blog'
  end
end
