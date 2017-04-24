class UsersController < ApplicationController
  def show
    @user = find_user!
  end

  def edit
    user = find_user!

    interaction_dependencies = {
      user: user,
      format_preference: format_preference,
      name: user.name,
      birth_date: preferred_format_formatter.date(user.birth_date)
    }

    @interaction = UpdateUser.new interaction_dependencies
  end

  def update
    interaction_dependencies = {
      user: find_user!,
      format_preference: format_preference
    }
    .reverse_merge(user_params)

    interaction = UpdateUser.run interaction_dependencies

    if interaction.valid?
      redirect_to interaction.user and return
    end

    @interaction = interaction

    render :edit
  end


  # def create
  #   user = User.find(1)
  #   user.birth_date = datetime_parser.date(user_params[:birth_date])
  #   user.created_at = datetime_parser.time(user_params[:created_at])
  #
  #   if user.valid?
  #     redirect_to :users, notice: 'Success' and return
  #   end
  #
  #   user.birth_date = user_params[:birth_date]
  #   user.created_at = user_params[:created_at]
  #   @user = user
  #
  #   render :index
  # end

  private

  def find_user_params
    params.permit(:id)
  end

  def find_user!
    outcome = FindUser.run find_user_params

    unless outcome.valid?
      fail ActiveRecord::RecordNotFound,
           outcome.errors.full_messages.to_sentence
    end

    outcome.result
  end

  def user_params
    params.require(:user).permit(:birth_date, :name)
  end
end
