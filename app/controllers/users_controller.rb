class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'

      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(user).deliver_now
      # format.html { redirect_to(user, notice: 'User was successfully created.') }
      # format.json { render json: user, status: :created, location: user }

    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
