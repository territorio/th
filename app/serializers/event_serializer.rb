class EventSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title, :body
  has_many :categories
end
