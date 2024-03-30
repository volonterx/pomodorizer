class Course < ApplicationRecord
  validates :name, :url, :duration, :start_date, :priority, presence: true
  validates :url, format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }
end
