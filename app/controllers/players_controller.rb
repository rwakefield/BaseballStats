class PlayersController < ApplicationController
  helper_method :players

  def index
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path
    else
      render 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def show
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to players_path
    else
      render 'edit'
    end
  end

  private

  def players
    Player.all
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :identifier, :birth_year);
  end
end
