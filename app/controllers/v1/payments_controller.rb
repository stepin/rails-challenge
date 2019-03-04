module V1
  class PaymentsController < ApplicationController

    def index
      patient_id = get_patient_id
      @payments = patient_id.blank? ? Payment.all : Payment.where('patient_id': patient_id).all
    end

    def import
      render json: {'status': 'OK'}
    end

    private

    def get_patient_id
      patient_external_id = params[:external_id]
      Patient.find_by_external_id patient_external_id
    end
  end
end
