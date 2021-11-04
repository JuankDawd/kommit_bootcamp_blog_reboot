class Relationship < ApplicationRecord
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  def follow?(other_user_id, current_user_id)
    Relationship.where(follower: current_user_id,
                       followed: other_user_id).blank?
  end
end
