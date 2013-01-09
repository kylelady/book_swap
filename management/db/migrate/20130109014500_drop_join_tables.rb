class DropJoinTables < ActiveRecord::Migration
  def change
		drop_table :sellers
		drop_table :buyers
  end
end
