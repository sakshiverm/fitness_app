class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    # reminders = Reminder.where('reminder_time <= ?', Time.current)
    users = User.all
    users.each do |user|
      user = user.email
      challenge = user.challenge
      message = "Reminder: Your upcoming challenge #{challenge.name} is starting soon!"
      NotificationMailer.send_notification(user, message).deliver_now
    end
  end
end