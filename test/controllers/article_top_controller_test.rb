require 'test_helper'

class ArticleTopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get article_top_index_url
    assert_response :success
  end

end
