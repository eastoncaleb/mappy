require 'rails_helper'

RSpec.describe "Searches", type: :system do
  let!(:user) { create(:user) }
  
  context "search" do
    before do
      sign_in user
      visit searches_path
    end

    it "should navigate to" do
      expect(page).to have_content "Previous Searches"
      click_on "New Search"
      expect(page).to have_content "New Search"
      expect(page).to have_content "Origin Address"
      expect(page).to have_content "Destination Address"
    end

    it "should create new" do
      # origin
      click_on "New Search"
      fill_in "search_origin_attributes_title", with: "White House"
      fill_in "search_origin_attributes_street", with: "1600 Pennsylvania Ave NW"
      fill_in "search_origin_attributes_city", with: "Washington"
      select "District of Columbia", from: "search_origin_attributes_state"
      fill_in "search_origin_attributes_zip_code", with: "20500"
      # destination
      fill_in "search_destination_attributes_title", with: "Lincoln Memorial"
      fill_in "search_destination_attributes_street", with: "2 Lincoln Memorial Cir NW"
      fill_in "search_destination_attributes_city", with: "Washington"
      select "District of Columbia", from: "search_destination_attributes_state"
      fill_in "search_destination_attributes_zip_code", with: "20002"
      click_on "Calculate"
      expect(page).to have_content "White House - Lincoln Memorial"
    end
  end
end
