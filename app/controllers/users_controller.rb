class UsersController < ApplicationController
  def show
    @items = current_user.symptoms.order(created_at: :asc)
    @items += current_user.drinks.order(created_at: :asc)
    @items += current_user.foods.order(created_at: :asc)
    @items += current_user.medications.order(created_at: :asc)
    @items += current_user.moods.order(created_at: :asc)
    @items = @items.sort_by { |item| item.created_at }
  end
end
