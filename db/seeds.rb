# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(:productID => 'C1',
  :category => 'Samera',
  :product_name =>   'Sony NEX6',    
  :price => 1199)
# . . .
Product.create(:productID => 'C2',
  :category => 'Camera',
  :product_name =>   'Sony NEX62',    
  :price => 1199)
# . . .

Product.create(:productID => 'C3',
  :category=> 'Camera',
  :product_name =>   'Sony NEX63',    
  :price => 1199)
