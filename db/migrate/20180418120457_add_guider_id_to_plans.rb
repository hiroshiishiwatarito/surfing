class AddGuiderIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :guider_id, :integer
  end
end
