module LinksHelper

  def short_url(link)
  	request.origin + '/'+ @link.slug
  end

end
