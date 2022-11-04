class TimelinesController < ApplicationController
  before_action :authenticate_user!
  def index
    render partial: 'symptoms/symptom', locals: { symptoms: @symptoms }
  end
end