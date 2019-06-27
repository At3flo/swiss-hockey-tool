class Event < ApplicationRecord
  belongs_to :club
  belongs_to :user
  belongs_to :category

  has_many :inscriptions, class_name: "inscription", foreign_key: "event_id"
end
