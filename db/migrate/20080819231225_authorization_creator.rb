class AuthorizationCreator < ActiveRecord::Migration
  def self.up
    add_column :authorizations, :authorizer_id, :integer
  end

  def self.down
    remove_column :authorizations, :authorizer_id
  end
end
