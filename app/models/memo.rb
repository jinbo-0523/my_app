class Memo < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true

end
