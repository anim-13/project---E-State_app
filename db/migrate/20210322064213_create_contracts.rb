class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.date :start_date
      t.date :end_date
      t.string :transaction_id
      t.string :amount
      t.string :transaction_mode
      t.references :user, null: false, foreign_key: true
      t.references :estate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
