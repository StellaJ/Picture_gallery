class UsersController < ApplicationController

layout 'admin'
	before_action :check_logon

  def index
  	@user = User.sort
  end


  def new
    @user = User.new
  end
  
  def create
     @user = User.new(user_params)
     if @user.save
      flash[:notice] = "You make it!"
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:notice] = "User was successfully updated"
      redirect_to(:action=>'index')
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def sakujo_suru
    user = User.find(params[:id]).destroy
     flash[:notice] = "User '#{user.user}' was successfully deleted"
    redirect_to(:action=>'index')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :user, :password, :password_confirmation)
  end
end
