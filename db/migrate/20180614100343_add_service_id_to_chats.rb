class AddServiceIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :service_id, :integer
    add_column :chats, :false, :string
    add_column :chats, :index, :string
    add_column :chats, :true, :string
  end
end
