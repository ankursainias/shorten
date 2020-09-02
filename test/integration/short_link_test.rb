require 'test_helper'

class ShortLinkTest < ActionDispatch::IntegrationTest
  fixtures :links

  test "short link flow" do
  		
  		get new_link_url
  		assert_response :success

  		assert_select "form input", 1
  		assert_select 'textarea', :count => 1
  		assert_select '[type=submit]', :count => 1
  		assert_select 'div[id=short-url]', :count => 1

  		url = links(:u1).url
  
  		post links_path, xhr: true,  params: { link: {url: url }}
  		assert_equal 'text/javascript; charset=utf-8', response.content_type
  		assert_response :success

  		assert_select 'p', :minimum => 2, :maximum => 3

  end
end
