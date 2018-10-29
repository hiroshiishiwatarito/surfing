class AddGuiderIdToInformation < ActiveRecord::Migration
  def change
    add_column :information, :guider_id, :integer
  end
end
