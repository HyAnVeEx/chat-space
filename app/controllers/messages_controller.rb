class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
  end

  def create
      @message = Message.new(content: message_params[:content], image: message_params[:image], user_id: current_user.id, group_id: params[:group_id])
      @message.save
  end

    def message_params
      # binding.pry
       params.require(:message).permit(:content, :image)
    end

end
