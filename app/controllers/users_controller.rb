class UsersController < ApplicationController
  def hovercard
    render 'hovercard'
  end

  def show
    @user = User.find(params[:id])
    @symptom = Symptom.find(params[:id])
  end

  def timeline
    @sympton_name = SymptomsController.new.columns
    @items = current_user.symptoms.order(created_at: :asc)
    @items += current_user.drinks.order(created_at: :asc)
    @items += current_user.foods.order(created_at: :asc)
    @items += current_user.medications.order(created_at: :asc)
    @items += current_user.moods.order(created_at: :asc)
    @items = @items.sort_by(&:created_at)
  end

  def insight
    render 'insight'
  end

  def popup
    render 'popup'
  end
end
