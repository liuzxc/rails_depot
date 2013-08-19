class Favorite < ActiveRecord::Base
	belongs_to :user
	has_one :product
    attr_accessible :product_id, :user_id

  
end
