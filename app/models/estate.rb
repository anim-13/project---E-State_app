class Estate < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :area, presence: true
  validates :bedroom, presence: true	
  validates :hall, presence: true
  validates :kitchen, presence: true	
  validates :park, presence: true		
end
