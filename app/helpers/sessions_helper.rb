module SessionsHelper

  # Logs the given user in
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    # if @current_user is not nil then the rightside of this assignment will not take precedent
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?
    !current_user.nil?
  end
end
