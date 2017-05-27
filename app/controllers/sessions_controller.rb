class SessionsController <ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully Logged In. Welcome #{@user.first_name.capitalize}!"
      redirect_to user_dashboard_index_path(@user)
    else
      flash[:concern] = "Missing Username or Password"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Logout Successful"
    redirect_to login_path
  end
end