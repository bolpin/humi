class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.references :grant, null: false, foreign_key: true
      t.string :donor
      t.date :date
      t.integer :amount_cents

      t.timestamps
    end
  end
end
