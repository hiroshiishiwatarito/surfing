class AddInformationIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :information_id, :integer
  end
end
