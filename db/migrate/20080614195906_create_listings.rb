class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :list_type
      t.integer :product_id
      t.integer :brand_id
      t.integer :store_id
      t.integer :user_id
      t.integer :private

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
