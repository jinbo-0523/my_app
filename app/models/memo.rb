class Memo < ApplicationRecord
  belongs_to :users
  mount_uploader :image, ImageUploader

end
