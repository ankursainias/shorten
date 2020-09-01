require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get links_new_url
    assert_response :success
  end

  test "should get stats" do
    get links_stats_url
    assert_response :success
  end

end
