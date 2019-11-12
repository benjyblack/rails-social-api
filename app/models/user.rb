class User < ApplicationRecord
  validates_uniqueness_of :username

  has_many :follower_relationships, foreign_key: :followee_id, class_name: 'Follower'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followee_relationships, foreign_key: :follower_id, class_name: 'Follower'
  has_many :followees, through: :followee_relationships, source: :followee

  def follows?(user)
    follow_relationship(user).present?
  end

  def follow(user)
    return if follows?(user)

    followee_relationships.create(followee: user)
  end

  def unfollow(user)
    follow_relationship(user)&.destroy
  end

  private

  def follow_relationship(user)
    followee_relationships.find_by_followee_id(user.id)
  end
end
