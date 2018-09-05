class LeaguesController < ApplicationController
  def index
    @leagues = League.all.order(:name)
  end

  def show
    @league = League.find(params[:id])
    @presenter = LeaguePresenter.new(league: @league)
  end
end
