class AddEventBody < ActiveRecord::Migration

  def change
    add_column :events, :body, :text
  end

end
