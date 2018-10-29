class AddCnyToChats < ActiveRecord::Migration
  def change
    add_column :chats, :cny, :integer
  end
end
