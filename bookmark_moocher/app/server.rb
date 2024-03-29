require 'sinatra/base'
require 'data_mapper'
require 'tilt/erb'
require_relative './data_mapper_setup'
require_relative './helpers'

class BookmarkMoocher < Sinatra::Base

  #include Helpers

  #require 'pry'; binding.pry
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    assign_tags(link, params[:tags])
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/links')
  end

  def assign_tags(link, tags)
    tags.split.each { |tag| link.tags << Tag.new(name: tag) }
    link.save
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
