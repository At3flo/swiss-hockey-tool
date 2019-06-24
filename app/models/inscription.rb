class Inscription < ApplicationRecord
  belongs_to :event
  belongs_to :club
  belongs_to :category
end
