class AddContentsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :contents, :text
  end
end
