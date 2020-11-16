class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def welcome_email(user)
    @user = user
    @url  = '/login'
    mail(to: @user.email, subject: 'Welcome to the Jungle!')
  end
end
