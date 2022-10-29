class MedicationsController < ApplicationController
  before_action :set_medication, only: %i[ show edit update destroy ]

  # GET /medications or /medications.json
  def index
    @medications = Medication.all
  end

  # GET /medications/1 or /medications/1.json
  def show

  end

  # GET /medications/new
  def new
    @user = current_user
    @available_symptoms = @user.symptoms
    @symptom = Symptom.find_by_id(params[:symptom_id])
    @medication = Medication.new
  end

  # GET /medications/1/edit
  def edit
  end

  # POST /medications or /medications.json
  def create
    @symptom = Symptom.find_by_id(params[:symptom_id])
    @medication = Medication.new(medication_params)

    if @medication.save
      redirect_to medications_path, notice: 'Symptom was successfully created.'
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @medication.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /medications/1 or /medications/1.json
  def update
    respond_to do |format|
      if @medication.update(medication_params)
        format.html { redirect_to medication_url(@medication), notice: "Medication was successfully updated." }
        format.json { render :show, status: :ok, location: @medication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medications/1 or /medications/1.json
  def destroy
    @medication.destroy

    respond_to do |format|
      format.html { redirect_to medications_url, notice: "Medication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication
      @medication = Medication.find(params[:id])
    end
  
    def set_symptom
      @symptom = Symptom.find(params[:symptom_id])
    end

    # Only allow a list of trusted parameters through.
    def medication_params
      params.require(:medication).permit(:name, :comment, :time, :date, :symptom_id)
    end
end
