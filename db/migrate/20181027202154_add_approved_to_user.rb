class AddApprovedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :approved, :boolean, null: false, default: false, index: true
  end
end
