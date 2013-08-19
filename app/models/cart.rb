class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items

  def add_product(product_id)
  	current_item = line_items.find_by_product_id(product_id)
  	if current_item
  		current_item.quantity += 1
  	else
  		current_item = line_items.build(:product_id => product_id)
      current_item.price = current_item.product.price
  	end
  	current_item
  end
  
  def total_price
    # price = 0
    #   line_items.each do |line_item|
    #   price += line_item.total_price
    # end
    # price

    line_items.sum {|line_item| line_item.total_price}
  end
end
