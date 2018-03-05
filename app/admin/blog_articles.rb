ActiveAdmin.register BlogArticle do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :body, :image, :title, :author, :infographic, :redaction, :created_at, :tag_list, :publish_on, :shorttext, :origin, :translate, :fixed
#
# or
#

  menu parent: "Articles"

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
      row :image do |ad|
        image_tag(ad.image.url) if ad.image&.url
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
    column :image do |i|
      image_tag i.image
    end
    column :title
    column :shorttext
    column :tag_list
    column :author
    column :created_at
    column :publish_on
    actions
  end

  form partial: 'blog_article_form'
end