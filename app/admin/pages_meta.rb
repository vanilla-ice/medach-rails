ActiveAdmin.register PageMeta do
  permit_params(
    :name,
    :url,
    :description,
    :title,
    :type,
    :keywords
  )
end