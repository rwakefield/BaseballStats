class LoaderJobsController < ApplicationController
  def new
    flash[:info] = 'Players are now loading in the background. Please check back later to see loaded players'
    PlayerLoaderJob.perform_later
    BatterLoaderJob.perform_later
    redirect_to root_path
  end
end
