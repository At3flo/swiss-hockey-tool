class RemoveTotalplacesFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :total_places, :string
  end
end
