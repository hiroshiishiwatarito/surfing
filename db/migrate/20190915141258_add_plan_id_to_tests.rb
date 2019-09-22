class AddPlanIdToTests < ActiveRecord::Migration
  def change
    add_column :tests, :plan_id, :integer
  end
end
