require 'sinatra/base'

MENU_ITEMS = []

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/items/new' do
    erb :new_item
  end

  post '/' do
    MENU_ITEMS << params[:item_name]
    erb :index
  end

end