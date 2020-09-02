require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest

	fixtures :links

  test "should get new" do
    get new_link_url
    assert_response :success
  end

  test "should get stats" do
    get stats_url
    assert_response :success
  end

  test "should  redirect to orginal url" do
  	slug  = links(:u1).slug
    get  "/#{slug}"
    assert_redirected_to links(:u1).url
  end

  test 'form submit must be as ajax' do

  	url = links(:u1).url
    post links_path, xhr: true,  params: { link: {url: url }}
    assert_response :success

  end     


end
