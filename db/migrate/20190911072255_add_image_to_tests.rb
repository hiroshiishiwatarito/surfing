class AddImageToTests < ActiveRecord::Migration
  def change
    add_column :tests, :image, :string
  end
end
