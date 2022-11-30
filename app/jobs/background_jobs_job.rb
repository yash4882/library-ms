class BackgroundJobsJob < ApplicationJob
  queue_as :default

  def perform(id)
    UserMailer.welcome_email(id).deliver_now
  end
end
