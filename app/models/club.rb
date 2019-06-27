class Club < ApplicationRecord
  has_many :users, class_name: "user", foreign_key: "club_id"
  has_many :events, class_name: "event", foreign_key: "club_id"
  has_many :inscriptions, class_name: "inscription", foreign_key: "club_id"
end
