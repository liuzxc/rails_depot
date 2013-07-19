class Favorite < ActiveRecord::Base
	belongs_to :user
	has_many :products
    attr_accessible :product_id, :user_id

  def add_product_to_favorite(product_id,user_id)
  	current_favorite = Favorites.find_by_user_id(user_id)
  	unless current_favorite
  		current_favorite = Favorites.build(:product_id => product_id, :user_id => user_id)
    end
    current_favorite
  end
  
end
