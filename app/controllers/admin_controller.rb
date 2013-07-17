class AdminController < ApplicationController
  def index
  	@total_orders   = Order.count
  	@total_products = Product.count
  	@total_users    = User.count
  end
end
