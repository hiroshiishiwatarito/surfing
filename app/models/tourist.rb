class Tourist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

has_many :guiders
has_many :to_messages
has_many :chats, through: :guiders

devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
