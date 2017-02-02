# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# [
#   ["Joe's", 4.5],
#   ["Bonjour Paris", 3],
#   ["Best pizza.com", 4.3]
# ].each do |restaurant|
#   Restaurant.create(name: restaurant[0], rating: restaurant[1])
# end


Restaurant.all.each do |r|
  (1..10).to_a.sample.times do
    r.reviews.create(rating: (0..5).to_a.sample)
  end
end
