class User < ApplicationRecord
  validates_uniqueness_of :username

  has_many :follower_relationships, foreign_key: :followee_id, class_name: 'Follower'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followee_relationships, foreign_key: :follower_id, class_name: 'Follower'
  has_many :followees, through: :followee_relationships, source: :followee
end
