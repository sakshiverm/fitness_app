class ReminderWorker
  include Sidekiq::Worker

  def perform(challenge_id)
    challenge = Challenge.find_by(id: challenge_id)
    return unless challenge # Exit early if challenge is not found

    users = challenge.user.challenges.where.not(id: challenge.id).map(&:user).uniq

    users.each do |user|
      message = "Reminder: Your upcoming challenge #{challenge.name} is starting soon!"
      NotificationMailer.send_notification(user, message).deliver_now
    end
  end
end



