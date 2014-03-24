require 'rspec/core'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "item management" do
  scenario "creating an item" do
    visit '/'
  end
end