class AddCategoriesToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :categories, :jsonb
  end
end
