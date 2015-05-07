class CreateBusinessesUsers < ActiveRecord::Migration
  def change
    create_join_table :businesses, :users
  end
end
