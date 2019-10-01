class AddPurposeToTests < ActiveRecord::Migration
  def change
    add_column :tests, :purpose, :text
  end
end
