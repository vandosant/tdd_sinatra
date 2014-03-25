require 'sinatra/base'
require './lib/items_repo'

#MENU_ITEMS = []
ITEMS_REPO = ItemsRepo.new

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/items/new' do
    erb :new_item
  end

  get '/items' do
    erb :items
  end

  post '/items' do
    #MENU_ITEMS << params[:item_name]
    @item_name = params[:item_name]
    ITEMS_REPO.add(@item_name)
    erb :items
  end

end