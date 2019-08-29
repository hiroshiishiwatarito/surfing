class AddFourthImageToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :fourth_image, :string
 
  end
end
