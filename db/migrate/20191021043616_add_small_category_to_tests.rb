class AddSmallCategoryToTests < ActiveRecord::Migration
  def change
    add_column :tests, :small_category, :string
  end
end
