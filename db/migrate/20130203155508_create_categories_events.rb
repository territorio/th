class CreateCategoriesEvents < ActiveRecord::Migration
  def change

    create_table :events do |t|
      t.string :title, :null => false

      t.timestamps
    end
    create_table :categories_events, :id => false do |t|
      t.references :category, :null => false
      t.references :event, :null => false

      t.timestamps
    end
    add_index :categories_events, [:category_id, :event_id], :unique => true
  end
end
