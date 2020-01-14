class CreateGrants < ActiveRecord::Migration[6.0]
  def change
    create_table :grants do |t|
      t.references :partner, null: false, foreign_key: true
      t.integer :amount_cents
      t.date :date
      t.integer :case_management_percentage

      t.timestamps
    end
  end
end
