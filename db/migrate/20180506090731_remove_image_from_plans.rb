class RemoveImageFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :image, :text
  end
end
