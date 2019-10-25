class AddDetailToTests < ActiveRecord::Migration
  def change
    add_column :tests, :detail, :text
  end
end
