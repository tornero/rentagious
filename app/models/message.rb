class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :content, :conversation_id, :user_id, :recipientEmail, :recipientFullName

  def message_time
  	created_at #.strftime("%D %l:%M %P")
  end

end
