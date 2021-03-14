class Admin < ApplicationRecord
  has_one_attached :avatar

has_secure_password
validates :password, presence: true, length: {minimum: 6}, allow_nil: true
validate :acceptable_image_type?


def displayed_image
  if avatar.attached?
    avatar
  else
    "blank.png"
  end
end
    validate :acceptable_image_type?

    def acceptable_image_type?
      return unless avatar.attached?
      return if avatar.content_type.in? ["image/png", "image/jpeg"]
      errors.add :avatar, "Só imagens com menos de 1mb"
      end
end
