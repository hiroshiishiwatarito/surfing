class AddFivewordToTests < ActiveRecord::Migration
  def change
    add_column :tests, :fiveword, :string
  end
end
