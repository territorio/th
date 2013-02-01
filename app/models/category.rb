class Category < ActiveRecord::Base

  attr_accessible :name

  def active_model_serializer
    CategorySerializer
  end

end
