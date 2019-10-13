class AddConfirmationAtToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :confirmed_at, :datetime
  end
end
