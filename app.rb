require 'sinatra/base'
require './lib/items_repo'

ITEMS_REPO = ItemsRepo.new

class App < Sinatra::Application
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
    item_name = params[:item_name]
    ITEMS_REPO.add(item_name)
    redirect '/items'
  end

  get '/items/:id' do
    id = params[:id]
    erb :id, locals: {id: id}
  end

  get '/items/:id/edit' do
    id = params[:id]
    erb :edit, locals: {id: id}
  end

  put '/items' do
    update_name = params[:update_name]
    id = params[:id].to_i
    ITEMS_REPO.items_hash.delete(id)
    ITEMS_REPO.items_hash[id] = update_name
    redirect '/items'
  end

  delete '/items' do
    id = params[:id].to_i
    ITEMS_REPO.items_hash.delete(id)
    redirect '/items'
  end

end