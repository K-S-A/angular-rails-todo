require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build :user }

# Associations tests
  it { expect(subject).to have_many(:todos) }

end
