class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :image, presence: true

  def img
    image.variant(resize: '600x600!').processed if image.attached?
  end

  has_many :comments, dependent: :destroy
end
