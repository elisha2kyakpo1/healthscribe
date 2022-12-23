class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]).where(user: current_user)
    @items = @user.symptoms.order(created_at: :asc)
                  .or(@user.foods.order(created_at: :asc))
                  .or(@user.medications.order(created_at: :asc))
                  .or(@user.moods.order(created_at: :asc))
  end
end
