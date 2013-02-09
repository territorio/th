module EventValidation
  extend ActiveSupport::Concern

  included do

    validates :categories, :presence => true

    validate :is_not_regular_has_end_date, :is_not_regular_has_day, :end_date_cannot_be_before_start_date

    def is_not_regular_has_end_date

      if !is_regular and end_date.blank?
        errors.add(:end_date, "can't be empty in a not regular event")
      end

    end
   
    def is_not_regular_has_day

      if !is_regular and !is_monday and !is_tuesday and !is_wednesday and !is_thursday and !is_friday and !is_saturday and !is_sunday
        errors.add(:is_regular, "one is_DAY property must be true in a not regular event")
      end

    end

    def end_date_cannot_be_before_start_date

      if !end_date.blank? and !start_date.blank? and end_date < start_date 
        errors.add(:end_date, "can't be before start date")
      end

    end

  end

end
