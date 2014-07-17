class AccessController < ApplicationController

 layout "admin"

  before_action :check_logon, :except => [:login, :logon, :logout]

  def index
  end

  def login
  end

  def logon

    if params[:user].present? && params[:password].present?
      admin_looking = User.where(:user => params[:user]).first
      if admin_looking
        admin_authorization = admin_looking.authenticate(params[:password])
      end
    end

    if admin_authorization
      session[:user_id] = admin_authorization.id
      session[:user] = admin_authorization.user
      flash[:notice] = "You are log in"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "eror: invalid name of user or password"
      redirect_to(:action => 'login')
    end

  end


  def logout
    session[:user_id] = nil
    session[:user] = nil
    flash[:notice] = "You are log out"
    redirect_to(:action => "login")
  end

end
