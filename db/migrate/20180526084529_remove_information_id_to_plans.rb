class RemoveInformationIdToPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :information_id, :integer
  end
end
