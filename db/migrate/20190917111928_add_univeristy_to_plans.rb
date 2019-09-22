class AddUniveristyToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :university, :string
  end
end
