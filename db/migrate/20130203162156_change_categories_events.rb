class ChangeCategoriesEvents < ActiveRecord::Migration
  def up
    change_column :categories_events, :created_at, :datetime, :null => true, :default => nil
    change_column :categories_events, :updated_at, :datetime, :null => true, :default => nil
  end

  def down
    change_column :categories_events, :created_at, :datetime
    change_column :categories_events, :updated_at, :datetime
  end
end
