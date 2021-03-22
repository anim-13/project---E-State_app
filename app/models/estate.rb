class Estate < ApplicationRecord
  belongs_to :user

  validates :name, :address, :area, :bedroom, :hall, :kitchen, :park, presence: true	
end
