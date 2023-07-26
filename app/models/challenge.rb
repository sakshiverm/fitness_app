class Challenge < ApplicationRecord
  belongs_to :user
  after_create :send_challenge_notification

  def send_challenge_notification
    users = User.joins(:challenges).where(challenges: { id: self.id })
    message = "New challenge: #{self.name} is now available!"
    users.each do |user|
      Notification.create(user: user, message: message)
    end
  end
end
