class UsersController < ApplicationController
  def index
    user = User.find 1
    user.birth_date = formatter.date(DateTime.iso8601 user.birth_date)
    user.created_at = formatter.time(DateTime.iso8601 user.created_at)
    @user = user
  end

  def create
    user = User.find(1)
    user.birth_date = parser.date(user_params[:birth_date])
    user.created_at = parser.time(user_params[:created_at])

    if user.valid?
      redirect_to :users, notice: 'Success' and return
    end

    user.birth_date = user_params[:birth_date]
    user.created_at = user_params[:created_at]
    @user = user

    render :index
  end

  def user_params
    params.require(:user).permit(:birth_date, :created_at)
  end
end
