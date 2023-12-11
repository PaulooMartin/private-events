class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    if @user
      render 'show'
    else
      redirect_to root_path, alert: "#{params[:username]} not found."
    end
  end
end
