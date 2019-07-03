class RemoveCategoryidFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :events, column: :category_id
  end
end
