class User < ApplicationRecord
  validates :name, :slots, :timer_duration, presence: true
  validates :timer_duration, numericality: { only_integer: true, greater_than: 0 }
  validates :slots, length: { is: 7 }

  has_many :courses
end
