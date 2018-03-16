ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :body, :image, :title, :author, :infographic, :redaction, :created_at, :tag_list, :publish_on, :shorttext, :origin, :translate, :fixed
#
# or
#

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
    # column :body
    column :tag_list
    column :author
    # column :redaction
    # column :infographic, label: "Изображение"
    # column :translate
    # column :origin
    column :created_at
    column :publish_on
    actions
  end

  form do |f|
    f.object.publish_on = Time.zone.now
    f.inputs do
      f.input :title, label: "Заголовок"
      f.inputs "Статья" do
        "<textarea id=\"article_body\" >
        #{f.object.body}
        </textarea> <input type=\"hidden\" id=\"quill_editor_input\" name=\"article[body]\">".html_safe

      end
      f.input :image
      f.input :shorttext, label: "Краткое описание", :placeholder => 'max 250 символов'
      f.input :tag_list, :placeholder => 'Теги через запятую'
      f.input :author, label: "Автор"
      f.input :redaction, label: "Редакция"
      f.input :infographic, label: "Инфографика"
      f.input :origin, label: "Оригинал"
      f.input :translate, label: "Перевод"
      f.input :created_at
      f.input :publish_on, label: "Отложенный постинг"
      f.input :image_url, :input_html => { :value => f.object.image.url }, as: :hidden
      f.input :fixed, label: "Закрепить в шапке"
    end
    f.actions
  end
end
