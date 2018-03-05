ActiveAdmin.register LongreadArticle do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :body, :cover_image, :title, :author, :infographic, :redaction, :created_at, :tag_list, :publish_on, :short_description, :origin, :translate, :fixed
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
    render 'admin/article', {article: longread_article}
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

  form partial: 'longread_article_form'
end
