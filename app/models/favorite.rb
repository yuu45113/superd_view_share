class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.favorited_by?(post, user)
    find_by(post_id: post.id, user_id: user.id).nil?
  end
end
