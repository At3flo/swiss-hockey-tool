class Event < ApplicationRecord
  belongs_to :club
  belongs_to :user

  has_many :inscriptions, dependent: :destroy

  validates :date, presence: true
  validates :period, presence: true
  validates :start_time, presence: true
  validates :categories, presence: true
  validates :location, presence: true
  validates :contact, presence: true
  validates :club_id, presence: true
  validates :user_id, presence: true
end
