ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name,
                user_profile_attributes: [:about, :facebook_account, :instagram_account, :telegram_account, :avatar]

  index do
    selectable_column
    id_column
    column :email
    column :full_name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.inputs 'Profile' do
      f.has_many :user_profile, allow_destroy: false, new_record: true do |ff|
        ff.input :about
        ff.input :facebook_account
        ff.input :instagram_account
        ff.input :telegram_account
        ff.input :avatar
      end
    end
    f.actions
  end

  show do
    attributes_table do
      default_attribute_table_rows.each do |field|
        row(field)
      end
    end
    panel 'User profile' do
      table_for user.user_profile do
        column :about
        column :facebook_account
        column :instagram_account
        column :telegram_account
        column :avatar
      end
    end

    active_admin_comments
  end

end
