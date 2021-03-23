class Estate < ApplicationRecord
  belongs_to :user
  has_one :contract, dependent: :destroy

  validates :name, :address, :area, :bedroom, :hall, :kitchen, :park, presence: true	
end
