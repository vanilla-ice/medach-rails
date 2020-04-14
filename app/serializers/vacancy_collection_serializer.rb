class VacancyCollectionSerializer < ActiveModel::Serializer
  attributes :collection, :meta

  def collection
    object[:collection].map do |item|
      VacancySerializer.new(item)
    end
  end

  def meta
    object[:meta]
  end
end