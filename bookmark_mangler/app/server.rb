require 'sinatra/base'
require 'data_mapper'
require_relative './data_mapper_setup'

class BookmarkMangler < Sinatra::Base

  set :views, proc { File.join(root, 'views') }

  get '/' do
    'Hello BookmarkMangler!'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
