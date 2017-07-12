class MessagesController < ApplicationController
    before_action :set_group
    before_action :set_groups
    before_action :set_messages

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :group_messages, notice: '投稿しました。'
    else
      flash.now[:alert] = 'メッセージの入力、もしくは画像の選択をしてください'
      render :index
    end

  end

  private
  def message_params
     params.require(:message).permit(:content, :image).merge(user_id: current_user.id,group_id: params[:group_id])
  end

  def set_group
       @group = Group.find(params[:group_id])
  end

  def set_groups
       @groups = current_user.groups
  end

  def set_messages
       @messages = @group.messages
  end
end
