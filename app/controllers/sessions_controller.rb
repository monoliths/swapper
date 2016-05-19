class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # this is our cookie, see sessions_helper file
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid login credendials."
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def log_out
    # get rid of the user id that stored in the sesion,
    session.delete(:user_id)
    @current_user = nil
  end
end
