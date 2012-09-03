class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.string :key
      t.boolean :value

      t.timestamps
    end
  end
end
