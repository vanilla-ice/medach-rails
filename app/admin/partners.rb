ActiveAdmin.register Partner do
  permit_params :url, :name, blog_article_ids: []

  form do |f|
    f.inputs do
      f.input :name, label: 'Название'
      f.input :url, label: 'URL адрес'
      f.input :blog_articles, :input_html => { multiple: true }
      f.actions
    end
  end

  index do
    column :id
    column 'Название', :name
    column 'URL', :url
    column 'Дата создания', :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :url
      row :blog_articles
    end
  end

end