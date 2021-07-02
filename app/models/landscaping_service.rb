class LandscapingService < ApplicationRecord
  belongs_to :senior
  belongs_to :student, optional: true
  validates :landscape_service, presence: true
  validates :fee_per_hour, presence: true
  validates :date_time, presence: true
  validates_associated :senior
  validates_associated :student
end
