class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
    	t.string :name
    	t.string :borough
    	t.string :days_open
    	t.string :hours
    	t.string :address

    	t.timestamps
    end
  end
end
