require 'rake'

class BatterLoaderJob < ActiveJob::Base
  queue_as :default

  def perform
    RocketHomework::Application.load_tasks
    Rake::Task['loader:load_batting'].invoke
  end
end
