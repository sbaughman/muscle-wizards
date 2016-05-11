class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :body, :user_id, :conversation_id, presence: true

  def message_time
    created_at.strftime(“%m/%d/%y at %l:%M %p”)
  end
  
end
