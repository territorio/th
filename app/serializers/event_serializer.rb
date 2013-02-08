class EventSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title, :body, :is_regular
  has_many :categories
end
