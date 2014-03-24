require 'rspec/core'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "item management" do
  scenario "creating an item" do
    visit '/'

   expect(page).to have_title "Scott and Ellie's Food!"

   #user can add an item
    click_on "Create Item"
    fill_in "item_name", with: "Chocolate"
    click_on "Submit Item"

    click_on "Create Item"
    fill_in "item_name", with: "Pizza"
    click_on "Submit Item"

    expect(page).to have_content "Chocolate Pizza"
  end
end