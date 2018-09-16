class CreateUserProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.text :about
      t.string :avatar
      t.string :facebook_account
      t.string :instagram_account
      t.string :telegram_account
    end
  end
end
