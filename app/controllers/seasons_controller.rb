class SeasonsController < ApplicationController
  def index
    @seasons = Season.all.order(:year)
  end

  def show
    @season = Season.find(params[:id])
    @presenter = SeasonPresenter.new(season: @season)
  end
end
