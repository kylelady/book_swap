class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :price
      t.references :data

      t.timestamps
    end
    add_index :books, :data_id
  end
end
