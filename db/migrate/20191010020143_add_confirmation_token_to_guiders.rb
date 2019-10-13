class AddConfirmationTokenToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :confirmation_token, :string
  end
end
