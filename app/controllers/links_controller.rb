# frozen_string_literal: true

class LinksController < ApplicationController
  
  # short url form
  def new
  	@link = Link.new
  end

  # all links stats
  def stats
  	@links = Link.includes(:link_visitors)
  end

  # redirect to original url
  def show
    link  = Link.find_by(slug: params[:slug])

    respond_to do |format|
      if link.expired?
        format.html { render :file => "#{Rails.root}/public/404", status: 404 }
      else
        link.clicked += 1
        link.save
        link.link_visitors.create(country: countries.sample)
        format.html { redirect_to link.url }
      end      
    end
  end

  # create a short url
  def create
  	@link = Link.new(link_params)

  	respond_to do |format|
	  	if @link.save
	  		 short_url
	  	end
      format.js
  	end
  end

  private

  # short url full path
  def short_url
  	@short_url =  request.base_url + '/'+ @link.slug
  end

  # permit attributes
  def link_params
  	params.require(:link).permit(:url)
  end

end
