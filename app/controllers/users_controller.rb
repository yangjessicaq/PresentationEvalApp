class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to presentations_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private 
    def require_login
      unless logged_in?
        redirect_to new_session_path, alert: "Please log in to view your account."
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
    end
end
