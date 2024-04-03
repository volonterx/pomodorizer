# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:priority) }
    it { should allow_value('http://example.com').for(:url) }
    it { should_not allow_value('example.com').for(:url) }
    it { should validate_uniqueness_of(:priority).scoped_to(:user_id) }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
    it { should validate_uniqueness_of(:url).scoped_to(:user_id) }

    it 'validates that expire_date is after start_date' do
      course = build(:course, start_date: Date.today, expire_date: Date.yesterday)
      course.valid?
      expect(course.errors[:expire_date]).to include('must be after the start date')
    end
  end
end
