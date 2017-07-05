class UsersController < ApplicationController
  def edit
  end
  def update
    @user = User.find(params[:id])
    if
      @user.update(name: user_params[:name],email: user_params[:email])
      redirect_to :root
    else
      render "edit"
    end
  end
  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
