class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
validates :image,presence: true

  def thumbnail
  if image.attached?
  return self.image.variant(resize: '600x600!').processed
  end
  end

end
