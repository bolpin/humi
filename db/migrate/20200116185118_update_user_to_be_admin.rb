class UpdateUserToBeAdmin < ActiveRecord::Migration[6.0]
  def up
    User.find_by_email("admin@example.com")&.update(admin: true)
  end
end
