class UsersController < ApplicationController
  # TODO: Can we use the virtus gem to coerce the response values from the
  # the API into other types (e.g. DateTime without calling DateTime.iso8601)
  # TODO: Should we change the model representations at all in the controller?
  # Should we use a decorator instead?
  def index
    user = User.find 1
    user.birth_date = datetime_formatter.date(DateTime.iso8601 user.birth_date)
    user.created_at = datetime_formatter.time(DateTime.iso8601 user.created_at)
    @user = user
  end

  def create
    user = User.find(1)
    user.birth_date = datetime_parser.date(user_params[:birth_date])
    user.created_at = datetime_parser.time(user_params[:created_at])

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
