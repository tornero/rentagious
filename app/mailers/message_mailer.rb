class MessageMailer < ActionMailer::Base
  default from: "Rentagious.com"
    
  def message_received_email(message)
    @message = message
    @url = 'http://www.rentagious.com/conversations/' + @message.conversation_id.to_s + '/messages'
    mail(to: @message.recipientEmail, subject: 'You just received a message on Rentagious.com!')
  end
    
end
