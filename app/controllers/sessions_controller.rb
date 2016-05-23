class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # this is our cookie, see sessions_helper file
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # if the user was trying to access a page which requires a login, the following funciton call will take care of that
      # else we route the to their user page after they login
      redirect_back_or user
    else
      flash.now[:danger] = "Invalid login credendials."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end


#  def log_out
    # get rid of the user id that stored in the sesion,
#    session.delete(:user_id)
#    @current_user = nil
#  end
end
