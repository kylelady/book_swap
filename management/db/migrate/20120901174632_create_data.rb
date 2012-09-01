class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :edition

      t.timestamps
    end
  end
end
