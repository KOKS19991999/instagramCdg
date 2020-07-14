class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_one_attached :avatar
  after_commit :add_ava, on: %i[create update]

  def avatar_size
    if avatar.attached?
      avatar.variant(resize: '100x100!').processed
    else
      'avatar.jpg'
end
end

  private

  def add_ava
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'avatar.jpg'
          )
        ),
        filename: '/avatar.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
