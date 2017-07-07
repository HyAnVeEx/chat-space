class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
     @group = Group.new(group_params)
    if @group.save
      params[:group][:user_ids].each do |id|
        @group.groups_users.create(user_id: id)
      end
      flash[:notice] = "グループを作成しました。"
      redirect_to :root
   else
      render "new"
    end
  end

  def edit
  end

  private

  def group_params
     params.require(:group).permit(:name, :user_ids)
  end
end
