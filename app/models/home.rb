class Home < ActiveRecord::Base
	belongs_to :guider
	belongs_to :plan
end