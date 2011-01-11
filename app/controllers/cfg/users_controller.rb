class Cfg::UsersController < ApplicationController
#GET /cfg/users
# cfg_users_path
  def index
    @users = User.all
  end
#GET /cfg/users/new
#new_user_path  
  def new
    @user = User.new
  end
  
#PUT /cfg/users
#cfg_users_path
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to cfg_users_path
    else
      render new_user_path
    end
  end
  
  def show
    
  end

#DELETE /cfg/users/1
#cfg_user_path(id)
  def destroy
    @user = User.find(params[:id])
    if @user.name == 'admin'
      flash[:notice] = "Admin couldn't be deleted"
    else
      @user.destroy
    end
    redirect_to cfg_users_path  
  end
  
end
