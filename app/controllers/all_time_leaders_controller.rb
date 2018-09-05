class AllTimeLeadersController < ApplicationController
  def index
    @presenter = AllTimePresenter.new
  end
end
