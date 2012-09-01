class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.references :person
      t.references :book

      t.timestamps
    end
    add_index :buyers, :person_id
    add_index :buyers, :book_id
  end
end
