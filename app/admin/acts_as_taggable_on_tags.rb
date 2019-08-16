ActiveAdmin.register ActsAsTaggableOn::Tag do
permit_params :name

menu label: 'Теги'

index title: 'Теги' do
  column :id
  column 'Название тэга', :name
  column 'Статьи' do |tag|
    articles = Article.includes(:tags).where(tags: {name: tag.name})
    articles.map do |article|
      link_to(article.id, admin_route_for(article)) if !a.blank?
    end.join(', ').html_safe
  end
  column 'Кол-во использований', :taggings_count
  actions
end

show do
end

end
