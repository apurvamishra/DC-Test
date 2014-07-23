require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:productID].any?
    assert product.errors[:category].any?
    assert product.errors[:product_name].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(:productID       => "C1",
                          :category => "Cameras",
                          :product_name   => "Sony NEX6")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", 
      product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", 
      product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

    test "product is not valid without a unique product_name" do
    product = Product.new(:productID   => "C1",
                          :category => "Cameras",
                          :product_name => products(:ruby).product_name, 
                          :price       => 1,)

    assert !product.save
    assert_equal "has already been taken", product.errors[:product_name].join('; ')
  end


  
end
