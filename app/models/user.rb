class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: {minimum: 5, maximum: 20}	
end
 