class Club < ApplicationRecord
  has_many :users
  has_many :events
  has_many :inscriptions
end
