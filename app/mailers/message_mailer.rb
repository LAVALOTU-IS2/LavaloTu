class MessageMailer < ActionMailer::Base

  default from: "lavalotuis2@gmail.com"
  default to: "lavalotuis2@gmail.com"


  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end

end