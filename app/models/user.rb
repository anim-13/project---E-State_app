class User < ApplicationRecord
  has_many :estates, dependent: :destroy 
  before_save { email.downcase! }
  
  has_secure_password
  validates :email, presence: true, uniqueness: true	
  validates :password, confirmation: true, length: {minimum: 6, maximum: 20}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
