class AddStudentNameToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :student_name, :string
  end
end
