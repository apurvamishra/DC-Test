 require 'CSV' #This class provides a complete interface to CSV files and data

class Product < ActiveRecord::Base
	
	default_scope {order('category')}  # --- Products in Alphabetical order of cat -- Apurva

	validates :productID, :category, :product_name, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :product_name, :uniqueness => true



	Product.delete_all
	CSV.foreach('C:\Users\Apurva\Desktop\products.csv', :headers => true) do |row|
	  	Product.create!(row.to_hash)
	end
	
	


end

    