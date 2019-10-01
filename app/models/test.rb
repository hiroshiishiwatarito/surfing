class Test < ActiveRecord::Base
	belongs_to :plan

	mount_uploader :book, BookUploader
end
