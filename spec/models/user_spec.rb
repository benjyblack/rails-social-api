require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be_a(described_class) }

  describe 'validations' do
    describe 'uniqueness' do
      subject { FactoryBot.build(:user) }

      context 'when no other user exists with the same username' do
        it { is_expected.to be_valid }
      end

      context 'when another user exists with the same username' do
        before { FactoryBot.create(:user, username: subject.username) }
        it { is_expected.to be_invalid }
      end
    end
  end
end
