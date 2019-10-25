class AddFourthwordToTests < ActiveRecord::Migration
  def change
    add_column :tests, :fourthword, :string
  end
end
