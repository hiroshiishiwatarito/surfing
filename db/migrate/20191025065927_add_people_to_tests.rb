class AddPeopleToTests < ActiveRecord::Migration
  def change
    add_column :tests, :people, :string
  end
end
