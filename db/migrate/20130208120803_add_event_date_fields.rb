class AddEventDateFields < ActiveRecord::Migration

  def change 
    add_column :events, :start_date, :date, :null=> false, :default => Date.current
    add_column :events, :end_date, :date
  end

end
