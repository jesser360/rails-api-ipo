class Artist < ApplicationRecord
  has_many :tasks
  belongs_to :user, optional: true
  has_one_attached :image

  def image_url
    self.image.attachment.service_url
  end
end
