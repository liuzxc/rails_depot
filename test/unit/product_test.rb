require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "products attibutes must not be empty!" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?
  end

  test "products price must be positive" do
  	product = Product.new(:title => 'ruby on rails',
  		:description => 'this is a good book',
  		:image_url => 'image/book.png')

    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", 
      product.errors[:price].join("; ")

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join("; ")

    product.price = 1
    assert product.valid?

  end

  test "products title must be greater than or equal to 10" do
    product = Product.new(:description => 'this is a book',
      :image_url => 'image/book.png',
      :price => 34.23 )

    product.title = 'ruby on'
    assert product.invalid?
    assert_equal "is too short (minimum is 10 characters)",
      product.errors[:title].join(": ")

    product.title = 'ruby on ra'
    assert product.valid?

    product.title = 'ruby on rails'
    assert product.valid?
  end


end

