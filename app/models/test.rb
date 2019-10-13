class Test < ActiveRecord::Base
	belongs_to :plan
	belongs_to :guider

	mount_uploader :book, BookUploader
end
