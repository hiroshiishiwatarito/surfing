class AddChatIdToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :chat_id, :integer
  end
end
