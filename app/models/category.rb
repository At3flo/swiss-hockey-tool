class Category < ApplicationRecord
  has_many :inscriptions, class_name: "inscription", foreign_key: "category_id"
  has_many :events, class_name: "event", foreign_key: "category_id"
end
