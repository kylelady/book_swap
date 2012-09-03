class AddBarcodeToPerson < ActiveRecord::Migration
  def change
    add_column :people, :barcode, :integer
  end
end
