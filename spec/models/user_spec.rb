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

  describe '#follow' do
    let(:follower) { FactoryBot.create(:user) }
    let(:followee) { FactoryBot.create(:user) }
    subject { follower.follow(followee) }

    it 'follows the user' do
      expect { subject }.to change(Follower, :count).by(1)
    end

    context 'user is already followed' do
      before do
        follower.follow(followee)
      end

      it 'does not follow them again' do
        expect { subject }.not_to change(Follower, :count)
      end
    end
  end

  describe '#unfollow' do
    let(:follower) { FactoryBot.create(:user) }
    let(:followee) { FactoryBot.create(:user) }
    subject { follower.unfollow(followee) }

    context 'user is not followed' do
      it 'does nothing' do
        expect { subject }.not_to change(Follower, :count)
      end
    end

    context 'user is followed' do
      before do
        follower.follow(followee)
      end

      it 'unfollows them' do
        subject
        expect(Follower.count).to be(0)
      end
    end
  end
end
