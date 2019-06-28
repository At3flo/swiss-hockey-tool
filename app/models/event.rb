class Event < ApplicationRecord
  belongs_to :club
  belongs_to :user
  belongs_to :category

  has_many :inscriptions, dependent: :destroy
end
