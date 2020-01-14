class CreateDisbursements < ActiveRecord::Migration[6.0]
  def change
    create_table :disbursements do |t|
      t.references :grant, null: false, foreign_key: true
      t.string :name
      t.date :date
      t.integer :move_in_amount_cents
      t.integer :prevention_amount_cents
      t.string :landlord
      t.integer :number_children

      t.timestamps
    end
  end
end
