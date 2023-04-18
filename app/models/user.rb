class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :books, dependent: :destroy
  has_one_attached :profile_image

  def get_profile_image(profile_image, width, height)
    if profile_image.present?
      profile_image.variant(resize_to_limit: [width, height]).processed
    else
      default_image_path = Rails.root.join('app/assets/images/default-image.jpg')
      image_tag('default-image.jpg', src: default_image_path, size: "#{width}x#{height}")
    end
  end
end
