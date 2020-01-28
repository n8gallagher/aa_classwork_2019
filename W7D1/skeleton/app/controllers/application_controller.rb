class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])

  end

 def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
 end

 def log_in(user)
    user = User.find_by_credentials(
        params[:user][:user_name],
        params[:user][:password]
    )
    if user.save
      log_in(user)
      user.reset_session_token!
      redirect_to cats_url
    else
      render json: user.errors.full_messages, status: 422
    end
 end

 def logged_in?
  !!current_user
 end

 def require_login
  redirect_to new_session_url unless logged_in?
 end

end
