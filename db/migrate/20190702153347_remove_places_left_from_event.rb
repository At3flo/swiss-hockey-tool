class RemovePlacesLeftFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :places_left, :string
  end
end
