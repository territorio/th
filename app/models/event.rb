class Event < ActiveRecord::Base

  has_and_belongs_to_many :categories
  attr_accessible :title, :category_ids, :body, :start_date, :end_date, :is_regular

  rails_admin do 

    list do
      field :title
      field :start_date
      field :categories
      field :is_regular
    end

    edit do
      field :title
      field :categories
      field :is_regular
      field :start_date
      field :end_date
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
