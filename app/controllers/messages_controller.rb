class MessagesController < ApplicationController
    before_action :move_to_sign_in
    before_action :set_group
    before_action :set_groups
    before_action :set_messages

  def index
    @message = Message.new
    respond_to do |format|
     format.html
     format.json
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: '投稿しました。'}
        format.json
      end
    else
      flash.now[:alert] = 'メッセージの入力、もしくは画像の選択をしてください'
      render :index
    end
  end

  private
  def message_params
     params.require(:message).permit(:content, :image).merge(user_id: current_user.id,group_id: params[:group_id])
  end

  def move_to_sign_in
        redirect_to new_user_session_path unless user_signed_in?
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
