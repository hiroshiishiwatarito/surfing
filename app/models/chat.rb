class Chat < ActiveRecord::Base
	has_many :guiders
	has_many :tourists, through: :guiders
	has_many :messages
	has_many :service_categories
	has_many :messages

	def join(tourist_id)
		self.chat_tourists.create(tourist_id: tourist_id)
	end
end
