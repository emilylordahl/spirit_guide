class CreateMarketsUsers < ActiveRecord::Migration
  def change
    create_join_table :markets, :users
  end
end
