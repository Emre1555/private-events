# frozen_string_literal: true

class Event < ApplicationRecord
  attr_accessor :event_name, :event_date

  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
end
