class CreateEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :estates do |t|
      t.string :name
      t.string :address
      t.string :area
      t.string :bedroom
      t.string :hall
      t.string :kitchen
      t.string :park
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
