class AddProductIdToFavorite < ActiveRecord::Migration
  def change
    add_column :favorites, :product_id, :integer
  end
end
