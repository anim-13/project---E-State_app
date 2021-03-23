class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :estate

  validates :start_date, :end_date, :transaction_id, :transaction_mode, :amount, presence: :true	
end
