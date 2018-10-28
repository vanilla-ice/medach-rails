class UpdateAdminUser < ActiveRecord::Migration[5.1]
  def change
    User.find_by(id: 1)&.update(approved: true, admin: true)
  end
end
