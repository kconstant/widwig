class AuthenticateController < ApplicationController
  layout 'authenticate'
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to posts_path
      else
        flash[:notice] = "Invalid user/password combination"
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "Log out complete"
    redirect_to login_authenticate_index_path
  end
end
