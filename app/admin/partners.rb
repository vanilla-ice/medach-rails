ActiveAdmin.register Partner do
  permit_params :url, :name, blog_article_ids: []

  form do |f|
    f.inputs do
      f.input :name, label: 'Название'
      f.input :url, label: 'URL адрес'
      f.input :blog_articles, :input_html => { multiple: true, class: 'chosen-select' }
      f.actions
    end
  end

  show do
    attributes_table do
      row :name
      row :url
      row :blog_articles
    end
  end

end