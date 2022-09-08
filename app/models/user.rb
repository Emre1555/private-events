# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :nickname, uniqueness: true

  has_many :attendances
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attended_events, through: :attendances, source: :event
end
