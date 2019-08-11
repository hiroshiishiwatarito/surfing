class AddStudentNameToInformation < ActiveRecord::Migration
  def change
    add_column :information, :student_name, :string
  end
end
