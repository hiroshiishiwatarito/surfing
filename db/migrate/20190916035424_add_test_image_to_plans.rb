class AddTestImageToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :test_image, :string
  end
end
