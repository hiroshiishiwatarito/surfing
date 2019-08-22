class AddTransportToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :transport, :string
  end
end
