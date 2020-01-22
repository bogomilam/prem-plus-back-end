class FollowSerializer < ActiveModel::Serializer
  attributes :id, :club, :user
  belongs_to :user
end
