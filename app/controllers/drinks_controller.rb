class DrinksController < ApplicationController
  before_action :set_drink, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /drinks or /drinks.json
  def index
    @user = current_user
    @drinks = Drink.all.order('created_at DESC').where(user: current_user)
  end

  # GET /drinks/1 or /drinks/1.json
  def show; end

  # GET /drinks/new
  def new
    @user = current_user
    @drink = Drink.new
  end

  # GET /drinks/1/edit
  def edit; end

  # POST /drinks or /drinks.json
  def create
    @user = current_user
    @drink = @user.drinks.build(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to timeline_path, notice: 'Drink was successfully created.' }
        format.json { render :show, status: :created, location: @drink }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinks/1 or /drinks/1.json
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to timeline_path, notice: 'Drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1 or /drinks/1.json
  def destroy
    @drink.destroy

    respond_to do |format|
      format.html { redirect_to timeline_path, notice: 'Drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_drink
    @drink = Drink.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def drink_params
    params.require(:drink).permit(:name, :comment, :time, :date, :user_id)
  end
end
