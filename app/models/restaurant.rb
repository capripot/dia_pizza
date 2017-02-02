class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :delete_all

  validates :name, presence: true
  validates :url, url: true

  def self.get(name)
    restaurants = Restaurant.where("LOWER(name) LIKE ?", "%#{name.downcase}%")

    return restaurants.first if restaurants.present? && restaurants.first.created_at > 1.day.ago

    restaurants.delete_all if restaurants.first

    infos = YelpService.retrieve_infos_for(name)
    if infos.present?
      restaurant = Restaurant.create(name: infos[:name], url: infos[:url], address: infos[:address])
      infos[:reviews].each do |review|
        restaurant.reviews.create(content: review[:content], rating: review[:rating])
      end

      return restaurant
    end

    nil
  end

end
