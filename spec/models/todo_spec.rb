require 'rails_helper'

RSpec.describe Todo, type: :model do
  subject { FactoryGirl.build :todo }

# Associations tests
  it { expect(subject).to belong_to(:user) }

#Validations tests
  it { expect(subject).to validate_presence_of(:title) }
  it { expect(subject).to validate_uniqueness_of(:title).scoped_to(:user_id).case_insensitive }
  it { expect(subject).to validate_length_of(:description).is_at_least(10).is_at_most(255) }
  it { expect(subject).to validate_numericality_of(:priority).only_integer }
  it { expect(subject).to validate_inclusion_of(:priority).in_range(0..5) }
  it { expect(subject).to validate_inclusion_of(:status).in_array(%w(active finished)) }

  context "due_date" do
    it "12-12-12 should not be valid" do
      expect(FactoryGirl.build(:todo, due_date: "12-12-12")).not_to be_valid
    end
    it "20151212 should not be valid" do
      expect(FactoryGirl.build(:todo, due_date: 20151212)).not_to be_valid
    end
    it "not existing date should not be valid" do
      expect(FactoryGirl.build(:todo, due_date: "2200-09-31")).not_to be_valid
    end
    it "past date should not be valid" do
      expect(FactoryGirl.build(:todo, due_date: 1.day.ago)).not_to be_valid
    end
    it "present date should be valid" do
      expect(FactoryGirl.build(:todo, due_date: Date.today)).to be_valid
    end
    it "future date should be valid" do
      expect(FactoryGirl.build(:todo, due_date: Date.tomorrow)).to be_valid
    end
  end

end
