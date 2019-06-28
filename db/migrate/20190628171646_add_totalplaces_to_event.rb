class AddTotalplacesToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :total_places, :integer
  end
end
