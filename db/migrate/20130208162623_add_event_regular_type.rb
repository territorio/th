class AddEventRegularType < ActiveRecord::Migration

  def change
    add_column :events, :is_regular, :boolean, :null=> false, :default => true
  end

end
