class UsersController < ApplicationController
  def hover_mood
  end

  def hover_medication
  end

  def hover_food
  end

  def hover_symptom
  end

  def hover_drink
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
