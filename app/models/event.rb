class Event < ActiveRecord::Base
  include EventValidation
  include EventRailsAdmin

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


  def active_model_serializer
    EventSerializer
  end

end
