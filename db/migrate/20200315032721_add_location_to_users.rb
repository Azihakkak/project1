class AddLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location, :text
  end
end
