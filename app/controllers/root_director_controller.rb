class RootDirectorController < ApplicationController
  def index
    if current_user
      redirect_to user_dashboard_index_path(current_user)
    else
      redirect_to login_path
    end
  end
end