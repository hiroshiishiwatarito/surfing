class Guider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :plans
  
  belongs_to :chat
  belongs_to :tourist

  def send_message(other_guider, room_id, content)
    from_messages.create!(to_id: other_tourist.id, room_id: room_id, content: content)
  end

  has_attached_file :avatar,
                      styles:  { medium: "100x100#", thumb: "50x50#" }
  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg","image/jpeg","image/png"]
end
