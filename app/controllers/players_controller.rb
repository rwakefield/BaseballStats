class PlayersController < ApplicationController
  before_filter :get_players, only: [:index]

  def index
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
    @presenter = PlayerPresenter.new(player: @player)
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

  def get_players
    @players = if params[:query]
                 PlayerSearch.new(query: params[:query]).search
               else
                 Player.all
               end.paginate(page: params[:page])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :identifier, :birth_year)
  end
end
