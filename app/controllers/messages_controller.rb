class MessagesController < ApplicationController
  before_action :require_user
  before_action :get_conversation
  before_action :set_prep
  before_action :user_owns_prep

  def index
    @messages = @conversation.messages.order(created_at: :asc)
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1].reverse
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages.order(created_at: :desc)
    end
    if @messages.last && new_message_count > 0
      others_messages = @conversation.messages.where(user_id: other_user(current_user))
      others_messages.update_all(read: true)
    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to prep_conversation_messages_path(prep_id: @prep.id, conversation_id: @conversation.id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def get_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

end
