class NotificationMailer < ApplicationMailer
  def send_notification(user, message)
    @user = user
    @message = message
    mail(to: @user.email, subject: 'Fitness Challenge Notification')
  end 
end
