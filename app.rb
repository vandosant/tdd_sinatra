require 'sinatra/base'
require './lib/items_repo'

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
    @item_name = params[:item_name]
    ITEMS_REPO.add(@item_name)
    erb :items
  end

  get '/items/:id' do
    @id = params[:id]
    erb :id
  end

end