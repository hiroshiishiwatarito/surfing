class AddOthersToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :others, :text
  end
end
