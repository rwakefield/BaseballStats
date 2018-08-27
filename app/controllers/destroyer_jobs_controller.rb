class DestroyerJobsController < ApplicationController
  def new
    flash[:danger] = 'Players are now being removed in the background'
    PlayerDestroyerJob.perform_later
    redirect_to root_path
  end
end
