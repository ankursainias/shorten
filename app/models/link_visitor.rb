# frozen_string_literal: true

class LinkVisitor < ApplicationRecord

	# validations
	before_validation :add_ip_address

	# associations
	belongs_to :link

	# initialize request ip address
  def add_ip_address
  	self.ip_address = Socket.ip_address_list.detect(&:ipv4_private?)&.ip_address
  end	


end
