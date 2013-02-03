class DeletePlaces < ActiveRecord::Migration
  def up

    drop_table :places

  end

  def down 
    create_table :places do |t|
      t.string :name, :null => false
 
      t.timestamps
    end

    add_index :places, :name, :unique => true

  end
end
