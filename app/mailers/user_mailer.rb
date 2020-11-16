class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def welcome_email(user)
    @user = user
    @url  = '/login'
    mail(to: @user.email, subject: 'Welcome to the Jungle!')
  end

  def order_email(user, order)
    @user = user
    @order = order
    @url = '/'
    mail(to: @user.email, subject: 'Thank you for your order!')
  end
end
