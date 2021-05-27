class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :attendings

  scope :past, -> { where("date < '#{Time.now}'") }
  scope :future, -> { where("date >= '#{Time.now}'") }
end
