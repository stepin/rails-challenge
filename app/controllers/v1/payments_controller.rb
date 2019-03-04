module V1
  class PaymentsController < ApplicationController

    def index
      patient_id = get_patient_id
      @payments = Payment.filter_by_patient_id_if_present(patient_id).all
    end

    def import
      render json: {'status': 'OK'}
    end

    private

    def get_patient_id
      return nil unless params.has_key? :external_id
      patient_external_id = params[:external_id]
      patient = Patient.find_by_external_id(patient_external_id)
      patient ? patient.id : ''
    end
  end
end
