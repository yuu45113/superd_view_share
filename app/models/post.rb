class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_many_attached :images
  
  validates :images, presence: true, blob: { content_type: :image }
  validates :name, presence: true
  validates :body, presence: true
  validates :address, presence: true
  
  def self.search(search)
  return Post.all unless search
  Post.where('name LIKE(?)', "%#{search}%")
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
