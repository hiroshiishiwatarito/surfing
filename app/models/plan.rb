class Plan < ActiveRecord::Base
	belongs_to :guider
	mount_uploader :image, ImageUploader
end
