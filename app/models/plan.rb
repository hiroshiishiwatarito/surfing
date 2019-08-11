class Plan < ActiveRecord::Base
	belongs_to :guider
	belongs_to :home
	
	mount_uploader :image, ImageUploader
end
