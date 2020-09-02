require 'test_helper'

class LinkTest < ActiveSupport::TestCase
	
	fixtures :links

	test "should not save link without url" do
	  object = Link.new(slug: links(:u1).slug , clicked: links(:u1).clicked )
	  assert_not object.save, 
	  									(I18n.t 'model.link.validation.presence', attribute: 'url')
	end

	test "should not save link without slug" do
	  object =  Link.new(slug: links(:u1).url , clicked: links(:u1).clicked )
	  assert_not object.save, 
	  									(I18n.t 'model.link.validation.presence', attribute: 'slug')
	end

	test "should not save link without valid url" do
	  object =  Link.new(slug: links(:u1).slug , clicked: links(:u1).clicked, url: 'Hello' )
	  assert_no_match URI::regexp(%w[http https]), object.url, 
	  											(I18n.t 'model.link.validation.presence', attribute: 'valid url')
	end

	test "should not save link if slug length is not equal to 5" do
	  object =  Link.new(slug: 'hhheee1324' , clicked: links(:u1).clicked, url: 'Hello' )
	 assert_not object.save, 
	  											(I18n.t 'model.link.validation.presence', attribute: 'invalid slug')
	end

	test "should not save link if slug is not alphamumeric" do
	  object =  Link.new(slug: 'gg12$' , clicked: links(:u1).clicked, url: 'Hello' )
	 assert_no_match  /\A[a-zA-Z'-]*\z/, object.slug, 
	  											(I18n.t 'model.link.validation.presence', attribute: 'invalid slug')
	end			

end
