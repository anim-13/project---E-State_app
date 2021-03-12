class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.string :pincode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
