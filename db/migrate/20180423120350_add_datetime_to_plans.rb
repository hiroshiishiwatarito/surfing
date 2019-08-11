class AddDatetimeToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :datetimes, :text
  end
end
