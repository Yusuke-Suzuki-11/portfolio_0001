class Movie < ApplicationRecord
  belongs_to :post

  validates :video, presence: true
  
  mount_uploader :video, VideoUploader
end
