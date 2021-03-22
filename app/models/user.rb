class User < ApplicationRecord
  has_many :estates, dependent: :destroy 
  has_many :addresses, dependent: :destroy 
  before_save { email.downcase! }
  
  has_secure_password
  validates :email, presence: true, uniqueness: true	
  validates :password, confirmation: true, length: {minimum: 6, maximum: 20}, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :contact, presence: true, numericality: true, length: {minimum: 8, maximum: 12}
end
