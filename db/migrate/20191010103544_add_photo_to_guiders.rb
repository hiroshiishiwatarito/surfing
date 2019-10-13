class AddPhotoToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :photo, :text
  end
end
