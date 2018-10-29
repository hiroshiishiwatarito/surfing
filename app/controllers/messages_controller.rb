class MessagesController < ApplicationController
  def create
    @message = current_tourist.messages.create(message_params)
    redirect_to :back if @message.save
  end


  private

  def message_params
    params.require(:message).permit(
    :chat_id,
    :tourist_id,
    :contents,
    :chat_id
    )
  end
end
