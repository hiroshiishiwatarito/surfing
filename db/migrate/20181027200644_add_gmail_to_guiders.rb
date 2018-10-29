class AddGmailToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :contact, :text
  end
end
