class AddPickUpToProfessions < ActiveRecord::Migration
  def change
    add_column :professions, :pick_up, :integer
  end
end
