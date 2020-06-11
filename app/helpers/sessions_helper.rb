module SessionsHelper
  def signin(user_id)
    session[:private_event_user_id] = user_id
  end

  def current_user
    @user = User.find_by(id: session[:private_event_user_id]) if session[:private_event_user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session[:private_event_user_id] = ''
  end
end
