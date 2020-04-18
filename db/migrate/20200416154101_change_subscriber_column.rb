class ChangeSubscriberColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :subscribers, :is_subscribed, :boolean, null: false, default: true
  end
end
