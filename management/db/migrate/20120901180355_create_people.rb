class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :uniqname
      t.string :umid
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
