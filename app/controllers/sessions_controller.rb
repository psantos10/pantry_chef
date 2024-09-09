class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    if (user = User.authenticate_by(email: params[:email], password: params[:password]))
      login_as(user)
      redirect_to root_path, notice: "Logged in!"
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unauthorized
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged out!"
  end
end
