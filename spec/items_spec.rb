require 'rspec/core'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "item management" do

  scenario "creating an item" do
    visit '/'

    click_on "Create Item"
    fill_in "item_name", with: "Chocolate"
    click_on "Submit Item"

    expect(page).to have_content "Chocolate"
  end

  scenario "showing an item" do
    visit '/items'

    click_on "Create Item"
    fill_in "item_name", with: "Pizza"
    click_on "Submit Item"

    click_link "Pizza"
    expect(page).to have_content "Pizza"
  end
end