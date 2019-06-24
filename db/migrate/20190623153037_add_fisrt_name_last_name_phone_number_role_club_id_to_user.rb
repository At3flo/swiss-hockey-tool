class AddFisrtNameLastNamePhoneNumberRoleClubIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :role, :string
    add_reference :users, :club, foreign_key: true
  end
end
