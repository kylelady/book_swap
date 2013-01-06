class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uniqname
      t.boolean :admin
      t.boolean :active

      t.timestamps
    end
  end
end
