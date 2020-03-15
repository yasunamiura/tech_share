class Article < ApplicationRecord
  scope :search, -> (word) { where(["title LIKE(?) OR content LIKE(?)", "%#{word}%","%#{word}%"])}
  has_many :article_comments, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
