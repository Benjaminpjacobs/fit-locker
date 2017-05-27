class UsersController<ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User Successfully Created, Welcome #{@user.first_name.capitalize}"
      redirect_to user_dashboard_index_path(@user)
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password)
    end
end