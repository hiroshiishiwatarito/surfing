class AddBigTitleToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :big_title, :string
  end
end
