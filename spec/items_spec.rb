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

    click_link "show Pizza"
    expect(page).to have_content "Pizza"
  end

  scenario "editing an item" do
    visit '/items'

    click_on "Create Item"
    fill_in "item_name", with: "Corn"
    click_on "Submit Item"

    click_link "edit Corn"
    fill_in "update_name", with: "Squash"
    click_on "Submit Item"

    expect(page).to have_content "Squash"
    expect(page).to_not have_content "Corn"
  end

  scenario "delete an item" do
    visit '/items'

    click_on "Create Item"
    fill_in "item_name", with: "Apple"
    click_on "Submit Item"

    click_on "delete Apple"

    expect(page).to_not have_content "Apple"
  end
end