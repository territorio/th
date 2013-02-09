module EventRailsAdmin
  extend ActiveSupport::Concern

  included do

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
          ckeditor true
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

  end

end
