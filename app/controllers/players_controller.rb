class PlayersController < ApplicationController
  def index
    if params[:query]
      @players = Player.where(first_name: params[:query]).or(Player.where(last_name: params[:query])).paginate(page: params[:page])
    else
      @players = Player.paginate(page: params[:page])
    end
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "#{@player.first_name} #{@player.last_name} has been created"
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
      flash[:success] = "#{@player.first_name} #{@player.last_name} has been updated"
      redirect_to players_path
    else
      render 'edit'
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :identifier, :birth_year)
  end
end
