class AddNicknameToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :nickname, :string
  end
end
