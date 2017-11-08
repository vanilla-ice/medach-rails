ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :body, :image, :title, :author, :infographic, :redaction, :created_at, :tag_list
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  # show do |article|
  #   attributes_table do
  #     row :title
  #     row :body
  #     row :preview_image do |a|
  #       image_tag a.preview_image
  #     end
  #     row :author
  #     row :redaction
  #     row :infographic
  #     row :created_at
  #   end
  # end
  show do
    attributes_table do
      row :title
      row :body
      row :image do |ad|
        image_tag(ad.image.url) if ad.image&.url
      end
      row :author
      row :redaction
      row :infographic
      row :created_at
    end
    active_admin_comments
  end

  index do
    column :image do |i|
      image_tag i.image
    end
    column :title
    column :body
    column :author
    column :redaction
    column :infographic
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Заголовок"
      f.input :body, as: :trumbowyg
      f.input :image
      f.input :tag_list
      f.input :author, label: "Автор"
      f.input :redaction, label: "Редакция"
      f.input :infographic, label: "Инфографика"
      f.input :created_at
    end
    f.actions
  end
end
