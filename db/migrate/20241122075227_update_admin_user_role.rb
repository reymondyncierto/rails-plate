class UpdateAdminUserRole < ActiveRecord::Migration[8.0]
  def change
    User.where(email: 'admin@gmail.com').update_all(role: 'admin')
  end
end
