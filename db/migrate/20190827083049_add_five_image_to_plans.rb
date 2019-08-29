class AddFiveImageToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :five_image, :string
  end
end
