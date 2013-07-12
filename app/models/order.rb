class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  attr_accessible :address, :email, :name, :pay_type
  validates :address, :email, :name, :pay_type, :presence => true
  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]
  validates :pay_type, :inclusion => PAYMENT_TYPES
  

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		item.cart.id = nil
  		line_items << item
  	end
  end


end
