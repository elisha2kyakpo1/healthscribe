class UsersController < ApplicationController
  def index
    #@users = User.includes(:symptoms, :medications, :foods, :moods, :drinks).all
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
