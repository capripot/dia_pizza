require "rails_helper"

feature "Show index page" do

  scenario "with no restaurant searched" do

    visit root_url

    expect(page).to have_content "Pizza restaurant reviews"
    expect(page).to have_content "Restaurant name"
    expect(page).to have_content "# of reviews"
    expect(page).to have_css ".button.primary[value=Search]"

  end

  context "searching for a restaurant" do

    let(:restaurant) { create(:restaurant_with_reviews) }

    it "should retrieve the cached restaurant" do
      visit root_url

      fill_in "Restaurant name", with: restaurant.name

      click_button "Search"

      expect(page).to have_content "#{restaurant.name} restaurant"
      expect(page).to have_content restaurant.address
      expect(page).to have_content restaurant.reviews.first.content
      expect(page).to have_css "table tbody tr", count: 1
      expect(page).to have_css ".fa-star", count: restaurant.reviews.first.rating
      expect(page).to have_content "cached at #{restaurant.created_at}"
    end

    context "average" do

      let(:restaurant) { create(:restaurant) }
      let(:reviews) {
        [
          create(:review, rating: 2, restaurant: restaurant),
          create(:review, rating: 2, restaurant: restaurant),
          create(:review, rating: 3, restaurant: restaurant)
        ]
      }

      it "should show the average and selected number of reviews" do
        reviews

        visit root_url

        fill_in "Restaurant name", with: restaurant.name
        select "3", from: "# of reviews"

        click_button "Search"

        expect(page).to have_content "Average of 2.33"
        expect(page).to have_css "table tbody tr", count: 3
      end
    end
  end

end
