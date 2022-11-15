class UsersController < ApplicationController
  def hovercard
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @my_symptoms = @user.symptoms
    @my_medications = @user.medications
    @my_foods = @user.foods
    @my_moods = @user.moods
    @my_drinks = @user.drinks
  end
end
