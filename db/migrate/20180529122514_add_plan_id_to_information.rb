class AddPlanIdToInformation < ActiveRecord::Migration
  def change
    add_column :information, :plan, :integer
  end
end
