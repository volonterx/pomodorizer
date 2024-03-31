require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slots) }
    it { should validate_presence_of(:timer_duration) }
    it { should validate_numericality_of(:timer_duration).only_integer.is_greater_than(0) }
    describe "slots validations" do
      let(:user) { build(:user, slots: Array.new(slots_number, 0)) }

      context "exactly 7 slots" do
        let(:slots_number) { 7 }
        it "should have 7 slots" do
          expect(user.valid?).to be_truthy
        end
      end
      context "less than 7 slots" do
        let(:slots_number) { 6 }
        it "should have 7 slots" do
          expect(user.valid?).to be_falsey
        end
      end
      context "more than 7 slots" do
        let(:slots_number) { 8 }
        it "should have 7 slots" do
          expect(user.valid?).to be_falsey
        end
      end
    end
  end

  describe 'associations' do
    it { should have_many(:courses) }
  end
end
