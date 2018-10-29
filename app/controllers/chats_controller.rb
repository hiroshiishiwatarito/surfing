class ChatsController < ApplicationController
  def show
	@chats = Chat.find(params[:id])
	@message = Message.new
	@message_logs = @chat.messages
  end

  def create
    @chat = Chat.create
    @chat.join(current_tourist.id)
    @chat.join(params[:chat][:reciever_id])
    redirect_to @chat
  end

end
