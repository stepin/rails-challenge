module V1
  class PatientsController < ApplicationController

    def index
      @patients = Patient.all
    end

    def import
      render json: {'status': 'OK'}
    end

    private

  end
end
