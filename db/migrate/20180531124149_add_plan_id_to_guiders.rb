class AddPlanIdToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :plan_id, :integer
  end
end
