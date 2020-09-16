class Memo < ApplicationRecord
  belongs_to :users
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true

end
