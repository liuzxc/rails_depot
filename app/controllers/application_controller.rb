class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  


  private

  def current_cart
  	Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  	cart = Cart.create
  	session[:cart_id] = cart.id
  	cart
  end
 

  def current_user
    user=User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      user
  end

  def admin_user
    if current_user == nil or not current_user.admin?
      redirect_to store_url
      flash[:error] = "You are not admin user!"
    end
  end

  def current_user
    user=User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      user
  end

  def admin_user
    if current_user == nil or not current_user.admin?
      redirect_to store_url
      flash[:error] = "You are not admin user!"
    end
  end



  protected

  def authorize
  	unless User.find_by_id(session[:user_id])
  		redirect_to login_url, :notice => "Please login in"
  	end
  end
  


end
