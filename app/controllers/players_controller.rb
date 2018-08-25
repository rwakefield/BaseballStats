class PlayersController < ApplicationController
  helper_method :players

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  private

  def players
    Player.all
  end
end
