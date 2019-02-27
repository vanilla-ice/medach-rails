ActiveAdmin.register AdBanner do
  permit_params(
    :ad_type,
    :ad_position,
    :article_type,
    :link,
    :image,
    :google_id
  )

  menu parent: 'Статьи'
end
