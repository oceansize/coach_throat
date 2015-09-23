require 'sinatra/base'
require_relative 'lib/game'
require_relative 'lib/birds'

class WebBattleships < Sinatra::Base

  #set :views, proc { File.join(root, '..', 'views') }

  GAME = Game.new

  get '/' do
    erb :index
  end

  get '/register_player' do
    erb :register_player
  end

  get '/birds' do
    @bird_array = Bird.new.generate_bird_array
    erb :birds_list
  end

  post '/registered' do
    @player1 = params[:player_name]
    GAME.add_player @player1
    p params
    erb :registered
  end

  def build_fleet
    [ Ship.aircraft_carrier,
      Ship.battleship,
      Ship.destroyer,
      Ship.submarine,
      Ship.patrol_boat ]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
