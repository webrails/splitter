class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:text)
  end
end
