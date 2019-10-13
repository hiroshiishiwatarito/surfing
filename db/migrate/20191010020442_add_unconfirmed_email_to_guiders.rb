class AddUnconfirmedEmailToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :unconfirmed_email, :string
  end
end
