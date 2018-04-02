ActiveAdmin.register PageMeta do

  menu parent: "SEO"

  permit_params(
    :name,
    :url,
    :description,
    :title,
    :type,
    :keywords
  )

  index do
    column 'Имя', :name
    column 'URL', :url
    column 'Description', :description
    column 'Title', :title
    column 'Keywords', :keywords
    actions
  end

end