class UserJob < ApplicationJob
  queue_as :default

  def perform(user)
    User.destroy_by(id: user.id)
  end
end
