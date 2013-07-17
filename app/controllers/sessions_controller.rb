class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def new_user
    @user = User.new
    render  "users/_form"
  end

  def create
  	if user= User.authenticate(params[:name],params[:password])
  		session[:user_id] = user.id
      if current_user.admin?
  		  redirect_to	admin_url
      else
        redirect_to store_url
      end
  	else
  		redirect_to login_url :alert => "Invalid name/password combination!"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url :notice => "Logged out"
  end

  def register
     @user = User.new(params[:user])

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to store_url
    else
      redirect_to new_user_path
   end
   end

  
end
