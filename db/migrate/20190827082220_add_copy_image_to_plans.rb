class AddCopyImageToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :copy_image, :string
   
  end
end
