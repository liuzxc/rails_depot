class Account < ActiveRecord::Base
  attr_accessible :email, :location, :name, :telphone
  belongs_to :user
end
