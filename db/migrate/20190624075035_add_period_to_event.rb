class AddPeriodToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :period, :string
  end
end
