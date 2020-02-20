class Comment < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates :post_id, presence: true

  belongs_to :user
  belongs_to :post
end
