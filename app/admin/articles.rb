ActiveAdmin.register Article do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
    permit_params(
      :body,
      :cover_image,
      :avatar_cache,
      :short_description,
      :avatar,
      :title,
      :author,
      :infographic,
      :redaction,
      :created_at,
      :tag_list,
      :publish_on,
      :shorttext,
      :origin,
      :translate,
      :fixed,
      :partner_id
    )
  #
  # or
  #
    filter :tags
    filter :body
    filter :title
    filter :created_at
    filter :author
    filter :infographic
    filter :redaction
    filter :origin
    filter :fixed
  
    show do
      attributes_table do
        row :title
        row :body
        row :cover_image do |ad|
          image_tag(ad.cover_image.url) if ad.cover_image&.url
        end
        row :tag_list
        row :author
        row :redaction
        row :infographic
        row :created_at
        row :publish_on
        row :shorttext
        row :translate
        row :origin
      end
      active_admin_comments
    end
  
    index do
      column :cover_image do |i|
        image_tag i.cover_image, class: "admin__cover-image"
      end
      column :title
      column :short_description
      column :tag_list
      column :author
      column :created_at
      column :publish_on
      actions
    end
  
  
    form partial: 'article_form'
  end
