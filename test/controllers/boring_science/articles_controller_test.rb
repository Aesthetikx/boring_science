require 'test_helper'

module BoringScience
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should get index' do
      get articles_url
      assert_response :success
    end
  end
end
