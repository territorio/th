class Place < ActiveRecord::Base

  attr_accessible :name

  def active_model_serializer
    PlaceSerializer
  end

end
