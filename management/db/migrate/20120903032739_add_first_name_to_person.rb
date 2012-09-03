class AddFirstNameToPerson < ActiveRecord::Migration
  def change
    add_column :people, :first_name, :string
  end
end
