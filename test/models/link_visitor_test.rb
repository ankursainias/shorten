require 'test_helper'

class LinkVisitorTest < ActiveSupport::TestCase
	
	fixtures :link_visitors

	test "should not save link visitor without link id" do
	  object = LinkVisitor.new(ip_address: link_visitors(:u1).ip_address , country: link_visitors(:u1).country )
	  assert_not object.save, 
	  									(I18n.t 'model.link.validation.presence', attribute: 'link id')
	end
end
