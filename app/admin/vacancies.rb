ActiveAdmin.register Vacancy do
  permit_params(
    :title,
    :employer,
    :location,
    :experience,
    :salary,
    :contacts,
    :is_promoted,
    :is_approved,
    :external_url,
    :content
  )

  menu parent: 'Вакансии'
  
  scope 'Все', :all
  scope ('Неподтвержденные') { |scope| scope.where(is_approved: false) }

  index do
    selectable_column
    id_column
    column 'Заголовок', :title do |v|
      link_to v.title, admin_vacancy_path(v)
    end
    column :employer
    column :location
    column :experience
    column :salary
    column :contacts
    column :is_promoted
    column :is_approved
  end

  filter :created_at

  form do |f|
    inputs do
      input :title
      input :employer
      input :location
      input :experience
      input :salary
      input :content, label: 'Текст вакансии', :input_html => { id: :article_body }
      input :contacts
      input :is_promoted
      input :is_approved
      input :external_url
    end

    actions
  end

  show do
    attributes_table do
      default_attribute_table_rows.each do |field|
        row(field)
      end
    end

    active_admin_comments
  end

end
