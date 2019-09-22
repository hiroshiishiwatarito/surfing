class AddBodyToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :body, :text
  end
end
