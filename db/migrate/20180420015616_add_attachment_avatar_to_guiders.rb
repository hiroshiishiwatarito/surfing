class AddAttachmentAvatarToGuiders < ActiveRecord::Migration
  def self.up
    change_table :guiders do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :guiders, :avatar
  end
end
