class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :productID
      t.string :category
      t.string :product_name
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
	drop_table :products
  end
end
