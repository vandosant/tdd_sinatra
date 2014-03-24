require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/items/new' do
    erb :new_item
  end

  post '/' do
    @name = params[:item_name]
    erb :index
  end

end