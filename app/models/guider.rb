class Guider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  mount_uploader :photo, BookUploader
  mount_uploader :driver, DriverUploader

  has_many :plans
  has_many :professions
  has_many :tests
  belongs_to :tourist

  after_create :send_admin_mail
  def send_admin_mail
    AdminMailer.new_guider_waiting_for_approval(self).deliver_now
    AdminMailer.new_guider_confirmation(self).deliver_now
  end

  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    approved? ? super : :not_approved
  end
end
