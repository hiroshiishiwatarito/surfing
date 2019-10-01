class AddSecondwordToTests < ActiveRecord::Migration
  def change
    add_column :tests, :secondword, :string
  end
end
