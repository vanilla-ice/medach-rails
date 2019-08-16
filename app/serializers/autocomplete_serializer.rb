class AutocompleteSerializer < ActiveModel::Serializer
  attributes :id
  attribute :label

  private

  def label
    object.name
  end
end
