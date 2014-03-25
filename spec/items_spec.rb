require 'rspec/core'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "item management" do
  before do
    visit '/'
    click_on "Create Item"
    fill_in "item_name", with: "Pizza"
    click_on "Submit Item"
  end

  #user can create item
  scenario "creating an item" do
    visit '/'

    click_on "Create Item"
    fill_in "item_name", with: "Chocolate"
    click_on "Submit Item"

    expect(page).to have_content "Pizza Chocolate"
  end

  #user can click "show item" and this opens a page with URL /item/:id
  scenario "showing an item" do
  pending
    visit '/items'

    click_on "Show Item"
    # click on "show item" next to item1, we should route to /item/1
    # write test to reference the value of a hash, where the URL contains the key
    expect(page).to have_content "Pizza"

  end

end