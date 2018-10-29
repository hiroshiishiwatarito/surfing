class AddContentsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :contents, :text
  end
end
