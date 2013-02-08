class AddEventDayFields < ActiveRecord::Migration
  def change

    add_column :events, :is_monday, :boolean, :null=> false, :default => false
    add_column :events, :is_tuesday, :boolean, :null=> false, :default => false
    add_column :events, :is_wednesday, :boolean, :null=> false, :default => false
    add_column :events, :is_thursday, :boolean, :null=> false, :default => false
    add_column :events, :is_friday, :boolean, :null=> false, :default => false
    add_column :events, :is_saturday, :boolean, :null=> false, :default => false
    add_column :events, :is_sunday, :boolean, :null=> false, :default => false

  end

end
