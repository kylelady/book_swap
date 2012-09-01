class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.references :person
      t.references :book

      t.timestamps
    end
    add_index :sellers, :person_id
    add_index :sellers, :book_id
  end
end
