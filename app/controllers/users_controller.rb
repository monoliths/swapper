class UsersController < ApplicationController
  # https://www.railstutorial.org/book/modeling_users 6.10
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, account created! Have fun storing some notes."
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end


end
