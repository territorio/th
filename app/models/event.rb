class Event < ActiveRecord::Base

  has_and_belongs_to_many :categories
  attr_accessible :title, :category_ids, :body

  rails_admin do 

    edit do

      field :title
      field :categories
      field :body do
        ckeditor do 
          true
        end
      end
    end
  end

  def active_model_serializer
    EventSerializer
  end

end
