class Event < ActiveRecord::Base

  class << self
    ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"].each do |day|
      define_method "check_#{day}" do
        condition = "(is_regular = :is_true) OR (is_regular = :is_false AND is_#{day} = :is_true)"
        where( condition , {:is_true => true, :is_false => false} )
      end
    end
  end

  scope :posible_date, lambda { |date| where( "(start_date = :date AND end_date IS NULL) OR (:date >= start_date AND :date <= end_date)" , {:date => date} ) }
  scope :by_category, lambda { |category| joins(:categories).where(:categories => {:id => category}) }
  


  has_and_belongs_to_many :categories
  attr_accessible :title, :category_ids, :body, :start_date, :end_date, :is_regular, :is_monday, :is_tuesday, :is_wednesday, :is_thursday, :is_friday, :is_saturday, :is_sunday

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
      field :start_date
      field :end_date
      field :body do
        ckeditor do 
          true
        end
      end

      field :is_regular

      field :is_monday
      field :is_tuesday
      field :is_wednesday
      field :is_thursday
      field :is_friday
      field :is_saturday
      field :is_sunday
    end
  end

  def active_model_serializer
    EventSerializer
  end

end
