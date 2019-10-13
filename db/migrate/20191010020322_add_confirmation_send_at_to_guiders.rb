class AddConfirmationSendAtToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :confirmation_sent_at, :datetime
  end
end
