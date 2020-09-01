# frozen_string_literal: true

class Link < ActiveRecord::Base

	# validations
  validates :url, presence: true, format: URI::regexp(%w[http https])
  validates_length_of :url, within: 3..255,  on: :create
  
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates_length_of :slug, is: 5,  on: :create

  before_validation :set_slug, on: :create

  # associations
  has_many :link_visitors, dependent: :destroy


  DEFAULT_LENGTH = 5


  # set slug before validate object
  def set_slug
  	random = SecureRandom.alphanumeric(DEFAULT_LENGTH).downcase
  	if Link.exists?(slug: random)
  		set_slug
  	else
  		
  		self.slug = random
  	end
  end

  # top 5 short url visited countries 
  def top_countries
  	ary = link_visitors.group(:country).count.sort {|a,b| b[1]<=>a[1]}.first(5)
  	ary.map { |a| a[0]}.join(", ")
  end

  # checking short link is expired or not
  def expired?
  	return false if (created_at + 1.month) > Time.now
  	true
  end

end