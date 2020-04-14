ActiveAdmin.register Subscriber do
  permit_params(
    :email,
    :is_subscribed
  )

  scope 'Все', :all
  scope ('Подписавшиеся') { |scope| scope.where(is_subscribed: true) }
  scope ('Отписавшиеся') { |scope| scope.where(is_subscribed: false) }

  index do
    id_column
    column :email
    column :is_subscribed
  end

  show do
    attributes_table do
      default_attribute_table_rows.each do |field|
        row(field)
      end
    end

    active_admin_comments
  end
end
