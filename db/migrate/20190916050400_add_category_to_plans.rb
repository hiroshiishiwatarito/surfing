class AddCategoryToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :category, :integer
  end
end
