class TimelinesController < ApplicationController
  before_action :authenticate_user!
  def index
    render "symptoms/index"
  end
end