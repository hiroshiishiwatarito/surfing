class AddAdvertiseToTests < ActiveRecord::Migration
  def change
    add_column :tests, :advertise, :text
  end
end
