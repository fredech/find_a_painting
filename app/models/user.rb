class User < ApplicationRecord
  #association
  has_many :paintings
  has_many :bookings

  mount_uploader :photo, PhotoUploader
  #validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates_presence_of :photo
  validates_integrity_of :photo
  validates_processing_of :photo
  #call_backs
  # before_save :ensure_authentication_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
