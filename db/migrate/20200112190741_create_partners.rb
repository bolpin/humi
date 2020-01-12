class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :address
      t.string :partner_number

      t.timestamps
    end
  end
end
