class AddTimeToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :times, :integer
  end
end
