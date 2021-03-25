class Estate < ApplicationRecord
  belongs_to :user
  has_one :contract, dependent: :destroy

  validates :name, :address, :area, :bedroom, :hall, :kitchen, :park, presence: true
  scope :buy_estate, ->(user_id) { includes(:contract).references(:contract).where('estate_id IS NULL').where.not('estates.user_id = ?', user_id) }	
end
