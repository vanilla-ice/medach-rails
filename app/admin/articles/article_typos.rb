# frozen_string_literal: true

ActiveAdmin.register ArticleTypo do
  permit_params(
    :typo_text,
    :commentary,
    :article_id
  )

  menu parent: 'Статьи'

  index do
    column 'Статья' do |a|
      link_to a.article.title, admin_route_for(a.article)
    end
    column 'Опечатка', :typo_text
    column 'Комментарий', :commentary
    column 'Исправлено', :fixed
    actions
  end

  show do
    attributes_table do
      row 'Статья' do |a|
        link_to a.article.title, admin_route_for(a.article)
      end
      row :typo_text
      row :commentary
      row :fixed
    end
  end
end
