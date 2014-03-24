require 'rspec/core'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "item management" do
  scenario "creating an item" do
    visit '/'

   expect(page).to have_title "Scott and Ellie's Food!"

  end
end