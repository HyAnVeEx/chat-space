class GroupsController < ApplicationController
    before_action :move_to_sign_in
    before_action :set_group, only:[:edit,:update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
     @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました。'
   else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを編集しました。'
    else
      render :edit
    end
  end

  private
    def group_params
       params.require(:group).permit(:name, :user_ids => [])
    end
    def set_group
       @group = Group.find(params[:id])
    end

    def move_to_sign_in
          redirect_to new_user_session_path unless user_signed_in?
    end
end
