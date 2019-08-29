class AddThirdImageToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :third_image, :string
   
  end
end
