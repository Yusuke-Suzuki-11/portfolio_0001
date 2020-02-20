class ChatMessage < ApplicationRecord
  validates :message, presence: true, length: { maximum: 50 }
  belongs_to :chat_room
  belongs_to :user
end
