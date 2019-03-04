module V1
  class PatientsController < ApplicationController

    def index
      render json: []
    end

    def import
      render json: {'status': 'OK'}
    end

    private
  end
end
