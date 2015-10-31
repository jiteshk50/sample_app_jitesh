class AccessController < ApplicationController
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  def index
  	# displays the login page
  end
  def login

  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
        found_user = AdminUser.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end

  	if authorized_user

  		#to do: mark the user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username

  		flash[:notice] ="you are now logged in"
  		redirect_to(:action => 'index')
  	else
  		flash[:notice] =" Invalid credintials"
  		redirect_to(:action=> 'login')
  	end
  end

  def logout
  	# to do: mark the user as logged out
    session[:user_id] = nil
    session[:username] = nil
  	flash[:notice] = "logged out"
  	redirect_to(:action=>"login")
  end
  
end
