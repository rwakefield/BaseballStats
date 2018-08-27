require 'rake'

class PlayerLoaderJob < ActiveJob::Base
  queue_as :default

  def perform
    RocketHomework::Application.load_tasks
    Rake::Task['loader:load_players'].invoke
  end
end
