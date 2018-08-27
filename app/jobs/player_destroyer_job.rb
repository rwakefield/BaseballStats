require 'rake'

class PlayerDestroyerJob < ActiveJob::Base
  queue_as :default

  def perform
    RocketHomework::Application.load_tasks
    Rake::Task['destroyer:destroy_players'].invoke
  end
end
