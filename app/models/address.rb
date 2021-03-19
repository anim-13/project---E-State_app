class Address < ApplicationRecord
  belongs_to :user

  validates :pincode, presence: true, uniqueness: true
  validates :country, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :city, presence: true	
end
