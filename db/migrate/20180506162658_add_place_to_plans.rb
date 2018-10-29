class AddPlaceToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :place, :string
  end
end
