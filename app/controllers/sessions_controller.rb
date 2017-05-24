class SessionsController <ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully Logged In"
      redirect_to user_dashboard_index_path(@user)
    else
      render :new
    end
  end
end