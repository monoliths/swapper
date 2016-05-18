class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:email])
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid login credendials."
      render 'new'
    end
  end
  
  def destroy
  end

end
