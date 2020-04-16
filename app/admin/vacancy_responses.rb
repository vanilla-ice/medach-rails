ActiveAdmin.register VacancyResponse do
  permit_params(
    :full_name,
    :phone,
    :email,
    :covering_letter,
    :document_id
  )

  menu parent: 'Вакансии'

  filter :created_at

  index do
    selectable_column
    id_column
    column 'Имя', :full_name do |response|
      link_to response.full_name, admin_vacancy_response_path(response)
    end
    column :phone
    column :email
    column 'Вакансия', :vacancy
  end

  show do
    attributes_table do
      row :full_name
      row :phone
      row :email
      row :vacancy
      row :covering_letter
      row :document do |response|
        response.document.present? ? link_to(response.document.url.file.filename, response.document.url.url, target: :blank) : nil
      end
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end

end
