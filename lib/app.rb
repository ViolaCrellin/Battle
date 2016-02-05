require 'sinatra/base'
require 'rack'
require_relative 'player'
require_relative 'game'


class Battle < Sinatra::Base
  # use Rack::Session::Pool, :expire_after => 2592000
  # set :sesion_secret, "super secret"


  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :player_sign_up
  end

  post '/names' do
    @player_one = Player.new(params[:player_one_name])
    @player_two = Player.new(params[:player_two_name])
    $game = Game.new(@player_one, @player_two)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end


  get '/attack1' do
  @game = $game
  @game.player_one_attacks
  erb :attack1
  end

  get '/attack2' do
  @game = $game
  @game.player_two_attacks
  erb :attack2
  end

  get '/wait_turn' do
    erb :wait_turn
  end

  get '/player_one_wins' do
    @game = $game
    erb :player_one_wins
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
