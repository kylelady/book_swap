class RemoveAndCreateBooks < ActiveRecord::Migration
  def change
		drop_table :books
    create_table :books do |t|
      t.integer :price
      t.references :datum
			t.references :seller
			t.references :buyer, { :null => true }

      t.timestamps
    end
    add_index :books, :datum_id
    add_index :books, :seller_id
    add_index :books, :buyer_id
  end
end
