class AddUserIdToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :user_id, :integers
  end
end
