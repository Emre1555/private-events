# frozen_string_literal: true

class Event < ApplicationRecord
  attr_accessor :event_name, :event_date

  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  validates :name, presence: true, allow_blank: false, length: { minimum: 5, maximum: 50 }
  validates :date, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false, length: { minimum: 5, maximum: 50 }



  validate do |event| 
    errors.add(:date, 'Event must be in the future') if event.date.present? && event.date < Date.today
  end
end
