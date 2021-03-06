class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :username, :name
  has_many :followers
end
