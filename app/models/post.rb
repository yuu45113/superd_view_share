class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  belongs_to :user
  has_many_attached :images

  validates :images, presence: true, blob: { content_type: :image }
  validates :name, presence: true
  validates :body, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def self.search(keyword)
  return Post.all unless keyword
  posts = []
  posts << Post.where("name like ?", "%#{keyword}%")
  posts << Post.where("address like ?", "%#{keyword}%")
  posts << Post.joins(:tags).merge(Tag.where("tags.name like ?", "%#{keyword}%"))
  posts.flatten.uniq
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def save_tag(sent_tags)
# タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
# 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
 # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      tag_to_delete = Tag.find_by(name: old)
      self.tags.delete(tag_to_delete) if tag_to_delete
    end

    # old_tags.each do |old|
    #   self.tags.delete Tag.find_by(name: old)
    # end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end
end
