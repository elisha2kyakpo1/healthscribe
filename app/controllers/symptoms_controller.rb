class SymptomsController < ApplicationController
  before_action :set_symptom, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /symptoms or /symptoms.json
  def index
    @user = current_user
    @symptoms = Symptom.all.order('created_at DESC').where(user: current_user)
  end

  # GET /symptoms/1 or /symptoms/1.json
  def show; end

  # GET /symptoms/new
  def new
    @symptom = Symptom.new
  end

  # GET /symptoms/1/edit
  def edit; end

  # POST /symptoms or /symptoms.json
  def create
    @user = current_user
    @symptom = current_user.symptoms.build(symptom_params)

    respond_to do |format|
      if @symptom.save
        format.html { redirect_to user_path(current_user), notice: 'Symptom was successfully created.' }
        format.json { render :show, status: :created, location: @symptom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /symptoms/1 or /symptoms/1.json
  def update
    respond_to do |format|
      if @symptom.update(symptom_params)
        format.html { redirect_to symptom_url(@symptom), notice: 'Symptom was successfully updated.' }
        format.json { render :show, status: :ok, location: @symptom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symptoms/1 or /symptoms/1.json
  def destroy
    @symptom.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Symptom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_symptom
    @symptom = Symptom.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def symptom_params
    params.require(:symptom).permit(:time, :date, :comment, :user_id, intensity: [])

    # para = params.require(:symptom).permit(:comment, :time, :date, :user_id)
    # para[:intensity] = params[:symptom][intensity: []].to_a
    # para
  end
end
