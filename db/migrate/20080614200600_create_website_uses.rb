class CreateWebsiteUses < ActiveRecord::Migration
  def self.up
    create_table :website_uses do |t|
      t.string :target_type
      t.integer :target_id
      t.integer :website_id

      t.timestamps
    end
  end

  def self.down
    drop_table :website_uses
  end
end
