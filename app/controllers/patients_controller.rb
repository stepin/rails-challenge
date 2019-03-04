class PatientsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: "ok"
  end

  def import
    render json: "ok"
  end

  private
end
