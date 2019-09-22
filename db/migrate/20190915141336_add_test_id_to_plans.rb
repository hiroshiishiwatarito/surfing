class AddTestIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :test_id, :integer
  end
end
