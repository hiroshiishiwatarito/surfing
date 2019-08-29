class Plan < ActiveRecord::Base
	belongs_to :guider
	belongs_to :home
	
	mount_uploader :image, ImageUploader
	mount_uploader :copy_image, CopyImageUploader
	mount_uploader :third_image, ThirdImageUploader
	mount_uploader :fourth_image, FourthImageUploader
	mount_uploader :five_image, FiveImageUploader
end
