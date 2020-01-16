class Users < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :partner, index: true
  end
end
