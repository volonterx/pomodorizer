class Course < ApplicationRecord
  validates :name, :url, :duration, :start_date, :priority, presence: true
  validates :url, format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }
  validate :expires_after_start_date
  validates :name, :url, uniqueness: { scope: :user_id }

  belongs_to :user

  def self.highest_priority
    order(priority: :desc).first&.priority || 0
  end

  private

  def expires_after_start_date
    return if expire_date.blank? || start_date.blank?
    if expire_date < start_date
      errors.add(:expire_date, "must be after the start date")
    end
  end
end
