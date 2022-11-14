class MoodsController < ApplicationController
  before_action :set_mood, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # GET /moods or /moods.json
  def index
    @moods = Mood.all.order('created_at DESC').where(user: current_user)
  end

  # GET /moods/1 or /moods/1.json
  def show; end

  # GET /moods/new
  def new
    @user = current_user
    @mood = Mood.new
  end

  # GET /moods/1/edit
  def edit; end

  # POST /moods or /moods.json
  def create
    @user = current_user
    @mood = @user.moods.build(mood_params)
    # create(user_id: curre.id, score: param.last[:score].to_i, book_id: param.first.to_i)

    respond_to do |format|
      if @mood.save
        format.html { redirect_to user_path(current_user), notice: 'Mood was successfully created.' }
        format.json { render :show, status: :created, location: @mood }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moods/1 or /moods/1.json
  def update
    respond_to do |format|
      if @mood.update(mood_params)
        format.html { redirect_to user_path(current_user), notice: 'Mood was successfully updated.' }
        format.json { render :show, status: :ok, location: @mood }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moods/1 or /moods/1.json
  def destroy
    @mood.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Mood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mood
    @mood = Mood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mood_params
    para = params.require(:mood).permit(:comment, :time, :date, :user_id)
    para[:mood] = params[:mood][:mood].to_i
    para
  end
end
