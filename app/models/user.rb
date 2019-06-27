class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  belongs_to :club, class_name: "club", foreign_key: "club_id"
  has_many :events, class_name: "event", foreign_key: "user_id"
end
