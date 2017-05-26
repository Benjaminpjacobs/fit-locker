class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

    def user_params
      params[:user][:role] = params[:user][:role].to_i
      params.require(:user).permit(:email, :first_name, :last_name, :role)
    end

    def set_user
      @user = User.find(params[:id])
    end
end