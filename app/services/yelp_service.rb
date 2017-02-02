require 'open-uri'

class YelpService

  SCRAPPER_HEADERS = {
    "User-Agent" => "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.20 (KHTML, like Gecko) Chrome/11.0.672.2 Safari/534.20"
  }

  def self.retrieve_infos_for(name)
    settings = Figleaf::Settings.yelp

    yelp_params =  {
      term: name,
      deals_filter: !settings.deals,
      category_filter: settings.category,
      sort: 0,
      limit: 1 # we want only the first result
    }

    result = Yelp.client.search(settings.location, yelp_params)

    Rails.logger.info "Yelp search executed with #{yelp_params}"

    return nil if result.businesses.empty?

    business = result.businesses.first

    Rails.logger.info "Yelp found business #{business.name} (#{business.url})"

    return nil unless business.name.downcase.include?(name.downcase)

    yelp_html = Nokogiri::HTML(open(business.url, self::SCRAPPER_HEADERS))

    restaurant_name = yelp_html.at_css(".biz-page-title").text.strip

    infos = {
      name: restaurant_name,
      address: business.location.display_address.join(", "),
      url: business.url,
      reviews: []
    }

    reviews = yelp_html.css(".review-list ul li")
    min = [reviews.size, 11].min

    (2..min).each do |i|
      review_container_rule = ".review-list ul li:nth-child(#{i}) .review-wrapper .review-content"
      content = yelp_html.at_css("#{review_container_rule} p")
      rating = yelp_html.at_css("#{review_container_rule} .i-stars")
      if content && rating
        infos[:reviews] << { content: content.text, rating: rating['title'].split(' ')[0] }
      end
    end


    return infos
  end

end
