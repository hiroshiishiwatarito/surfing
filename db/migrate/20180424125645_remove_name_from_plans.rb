class RemoveNameFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :name, :string
  end
end
