class MessagesController < ApplicationController
    before_action :set_group

  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to :group_messages, notice: '投稿しました。'
    else
      @groups = current_user.groups
      flash.now[:alert] = 'メッセージの入力、もしくは画像の選択をしてください'
      render :index
    end

  end

  private
  def message_params
     params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
       @group = Group.find(params[:group_id])
  end

end
