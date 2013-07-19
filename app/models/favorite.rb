class Favorite < ActiveRecord::Base
	belongs_to :user
	has_many :products
    attr_accessible :product_id, :user_id

  
end
