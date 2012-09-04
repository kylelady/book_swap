class AddCourseToDatum < ActiveRecord::Migration
  def change
    add_column :data, :course, :string
  end
end
